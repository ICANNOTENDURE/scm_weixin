package com.dhcc.scm.tool.cert;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.Security;
import java.security.SignatureException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;

import javax.security.auth.x500.X500Principal;

import org.bouncycastle.asn1.ASN1Set;
import org.bouncycastle.asn1.DERObjectIdentifier;
import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.DERSet;
import org.bouncycastle.asn1.pkcs.Attribute;
import org.bouncycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.bouncycastle.asn1.x509.ExtendedKeyUsage;
import org.bouncycastle.asn1.x509.GeneralName;
import org.bouncycastle.asn1.x509.GeneralNames;
import org.bouncycastle.asn1.x509.KeyPurposeId;
import org.bouncycastle.asn1.x509.KeyUsage;
import org.bouncycastle.asn1.x509.X509Extension;
import org.bouncycastle.asn1.x509.X509Extensions;
import org.bouncycastle.jce.PKCS10CertificationRequest;
import org.bouncycastle.openssl.PEMReader;
import org.bouncycastle.openssl.PEMWriter;
import org.bouncycastle.x509.X509V3CertificateGenerator;
import org.bouncycastle.x509.extension.AuthorityKeyIdentifierStructure;
import org.bouncycastle.x509.extension.SubjectKeyIdentifierStructure;

/**
 * <p>标题: Cert.java</p>
 * <p>业务描述:统一运维及安全管理平台</p>
 * <p>公司:东华软件股份公司</p>
 * <p>版权:dhcc2013</p>
 * @author 于鸿
 * @date 2013年10月18日
 * @version V1.0 
 */
public class Cert {
	
	private int keyLen=1024;	// 密钥长度 1024/2048
	private String subjectStr="";	// 证书主题，例 "CN=test,OU=东华 软件,O=医疗事业部,L=成都市,ST=四川,C=中国"
	private String beginDate="";	// 证书生效日期，例 "2012/8/1 0:0:0"
	private String endDate="";	// 证书过期日期，例 "2015/8/1 0:0:0"
	private String email="";	// 符合Email规范的证书别名，例 "dhcc@dhcc.com.cn"
	
	public Cert() {
	}
	
	public Cert(int keyLen) {
		this.keyLen = keyLen;
	}
	
	/**
	 * 
	* 方法名:          CreateSelfSignCert
	* 方法功能描述:    获取自签名证书
	* @param:         证书保存路径，证书名称，主题信息，证书生效时间，证书到期时间，email
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:20:13
	 */
	public void CreateSelfSignCert( String exportFilePath, String exportFileName,
			String subjectStr, String beginDate, String endDate, String email) throws Exception {
		this.subjectStr = subjectStr;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.email = email;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair pair = generateRSAKeyPair();
		String certPath=exportFilePath+exportFileName+".cer";
		String keyPath=exportFilePath+exportFileName+".key";
		X509Certificate cert = generateV3Certificate_SelfSign(pair);
		ExportPEMFile(cert, certPath);
		ExportPEMFile(pair, keyPath);
	}
	
	/**
	 * 
	* 方法名:          CreateCertRequestFile
	* 方法功能描述:    生成证书请求文件和私钥文件
	* @param:         文件保存路径，文件名称，申请者信息，申请者email
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:29:15
	 */
	public void CreateCertRequestFile(String exportFilePath, String exportFileName,
			String subjectStr, String email) throws Exception {
		this.subjectStr = subjectStr;
		this.email = email;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair pair = generateRSAKeyPair();
		PKCS10CertificationRequest request = generateRequest(pair);
		String requestPath=exportFilePath+exportFileName+".csr";
		String priKeyPath=exportFilePath+exportFileName+".key";
		ExportPEMFile(request, requestPath);
		ExportPEMFile(pair, priKeyPath);
	}
	/**
	 * 
	* 方法名:          CreateIssueCert
	* 方法功能描述:    签发证书
	* @param:         证书生效时间，证书到期时间，根证书路径，根证书密钥路径，证书请求文件路径
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:32:19
	 */
	public void CreateIssueCert( String beginDate, String endDate,
			String rootCertPath, String rootKeyPath, String requestPath) throws Exception {
		this.beginDate = beginDate;
		this.endDate = endDate;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		X509Certificate rootCert=(X509Certificate)ImportPEMFile(rootCertPath);
		KeyPair rootKey=(KeyPair)ImportPEMFile(rootKeyPath);
		PKCS10CertificationRequest request=(PKCS10CertificationRequest)ImportPEMFile(requestPath);
	    X509Certificate issuedCert = buildChain(rootCert,rootKey.getPrivate(),request);
		
	    String[] arraytemp=requestPath.split("\\.");
		String issuedCertPath=arraytemp[0];
		arraytemp[arraytemp.length-1]="cer";
		for(int i=1;i<arraytemp.length;i++){
			issuedCertPath=issuedCertPath+"."+arraytemp[i];
		}
	    ExportPEMFile(issuedCert, issuedCertPath);
	}

	/**
	 * 
	* 方法名:          CreateCertNoRequest
	* 方法功能描述:    直接颁发证书
	* @param:         文件保存路径，文件名称，申请者信息，证书生效时间，证书到期时间，申请者email，根证书路径，根证书密钥路径
	* @return:        无
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:34:09
	 */
	public void CreateCertNoRequest(String exportFilePath, String exportFileName,
			String subjectStr, String beginDate, String endDate, String email,
			String rootCertPath, String rootKeyPath) throws Exception {
		this.subjectStr = subjectStr;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.email = email;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair pair = generateRSAKeyPair();
		PKCS10CertificationRequest request = generateRequest(pair);
		
		String priKeyPath=exportFilePath+exportFileName+".key";
		String issuedCertPath=exportFilePath+exportFileName+".cer";

		X509Certificate rootCert=(X509Certificate)ImportPEMFile(rootCertPath);
		KeyPair rootKey=(KeyPair)ImportPEMFile(rootKeyPath);
	    X509Certificate issuedCert = buildChain(rootCert,rootKey.getPrivate(),request);
	    
		ExportPEMFile(pair, priKeyPath);
	    ExportPEMFile(issuedCert, issuedCertPath);
	}

	/**
	 * 
	* 方法名:          GetIssuedCertAndKeyByStr
	* 方法功能描述:    通过根证书及密钥字符串直接颁发证书
	* @param:         根证书字符串，根证书密钥字符串，申请者信息，证书生效时间，证书到期时间，申请者email，
	* @return:        证书及密钥字符串
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:36:59
	 */
	public String GetIssuedCertAndKeyByStr(String rootCertStr, String rootKeyStr,
			String subjectStr, String beginDate, String endDate, String email) throws Exception {
		this.subjectStr = subjectStr;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.email = email;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair pair = generateRSAKeyPair();
		PKCS10CertificationRequest request = generateRequest(pair);

	    X509Certificate rootCert=(X509Certificate)PEMStringToObj(rootCertStr);
	    KeyPair rootKey=(KeyPair)PEMStringToObj(rootKeyStr);
	    X509Certificate issuedCert = buildChain(rootCert,rootKey.getPrivate(),request);
	    
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		Writer wr=new OutputStreamWriter(baos);
		PEMWriter pemWrt = new PEMWriter(wr);
		pemWrt.writeObject(issuedCert);
		pemWrt.writeObject(pair);
		pemWrt.close();
		String result = baos.toString();
		return result;
	}

	/**
	 * 
	* 方法名:          GetIssuedCertAndKeyByPath
	* 方法功能描述:    通过根证书及密钥文件路径直接颁发证书
	* @param:         根证书路径，根证书密钥路径，申请者信息，证书生效时间，证书到期时间，申请者email，
	* @return:        证书及密钥字符串
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:40:41
	 */
	public String GetIssuedCertAndKeyByPath(String rootCertPath, String rootKeyPath,
			String subjectStr, String beginDate, String endDate, String email) throws Exception {
		this.subjectStr = subjectStr;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.email = email;
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair pair = generateRSAKeyPair();
		PKCS10CertificationRequest request = generateRequest(pair);

		X509Certificate rootCert=(X509Certificate)ImportPEMFile(rootCertPath);
		KeyPair rootKey=(KeyPair)ImportPEMFile(rootKeyPath);
	    X509Certificate issuedCert = buildChain(rootCert,rootKey.getPrivate(),request);
	    
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		Writer wr=new OutputStreamWriter(baos);
		PEMWriter pemWrt = new PEMWriter(wr);
		pemWrt.writeObject(issuedCert);
		pemWrt.writeObject(pair);
		pemWrt.close();
		String result = baos.toString();
		return result;
	}

	/**
	 * 
	* 方法名:          GetCertPro
	* 方法功能描述:    通过证书字符串获取证书对象
	* @param:         证书字符串
	* @return:        证书对象
	* @Author:        于鸿
	* @Create Date:   2013年10月18日 下午12:44:13
	 */
	public CertPro GetCertPro(String certStr) throws Exception {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
	    X509Certificate cert=(X509Certificate)PEMStringToObj(certStr);
	    CertPro certPro=new CertPro();
	    SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    
	    certPro.setVersion(cert.getVersion());
	    certPro.setSerialNumber(cert.getSerialNumber().toString());
	    certPro.setSigAlgName(cert.getSigAlgName());
	    certPro.setType(cert.getType());
	    certPro.setIssuerDN(cert.getIssuerDN().toString());
	    certPro.setSubjectDN(cert.getSubjectDN().toString());
	    certPro.setBeginTime(sf.format(cert.getNotBefore()));
	    certPro.setEndTime(sf.format(cert.getNotAfter()));
	    if(cert.getIssuerAlternativeNames()!=null)
	    	certPro.setIssuerAlternativeNames(cert.getIssuerAlternativeNames().toString());
	    if(cert.getSubjectAlternativeNames()!=null)
		    certPro.setSubjectAlternativeNames(cert.getSubjectAlternativeNames().toString());
		return certPro;
	}
	
	/**
	 * 
	* 方法名:		CertStrToObj
	* 方法功能描述:	通过字符串获取证书对象
	* @param:		证书PEM格式字符串
	* @return:		X509Certificate
	* @Author:		于鸿
	* @Create Date:   2013年11月20日 下午4:57:02
	 */
	public X509Certificate CertStrToObj(String certStr) throws Exception {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
	    X509Certificate obj=(X509Certificate) PEMStringToObj(certStr);
	    return obj;
	}
	public KeyPair KeyStrToObj(String keyStr) throws Exception {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyPair obj=(KeyPair) PEMStringToObj(keyStr);
	    return obj;
	}
	
	// This method generate a self signed Certificate
	protected X509Certificate generateV3Certificate_SelfSign(KeyPair pair) throws InvalidKeyException,
    NoSuchProviderException, SignatureException {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		X509V3CertificateGenerator certGen = new X509V3CertificateGenerator();

		certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
		certGen.setIssuerDN(new X500Principal(subjectStr));
		certGen.setNotBefore(new Date(beginDate));
		certGen.setNotAfter(new Date(endDate));
		certGen.setSubjectDN(new X500Principal(subjectStr));
		certGen.setPublicKey(pair.getPublic());
		certGen.setSignatureAlgorithm("SHA256WithRSAEncryption");
		
		certGen.addExtension(X509Extensions.KeyUsage, true, new KeyUsage(KeyUsage.cRLSign
				| KeyUsage.dataEncipherment | KeyUsage.digitalSignature | KeyUsage.keyAgreement
				| KeyUsage.keyCertSign | KeyUsage.keyEncipherment | KeyUsage.nonRepudiation));
		certGen.addExtension(X509Extensions.ExtendedKeyUsage, true, new ExtendedKeyUsage(
				KeyPurposeId.anyExtendedKeyUsage));
		if (!email.equals("")&&email.length()>0){
			certGen.addExtension(X509Extensions.SubjectAlternativeName, false, new GeneralNames(
					new GeneralName(GeneralName.rfc822Name, email)));
		}
		return certGen.generateX509Certificate(pair.getPrivate(), "BC");
	}
	
	// This method generate a RSA KeyPair
	protected KeyPair generateRSAKeyPair() throws Exception {
		KeyPairGenerator kpGen = KeyPairGenerator.getInstance("RSA", "BC");
		kpGen.initialize(keyLen, new SecureRandom());
		return kpGen.generateKeyPair();
	}
	
	// This method generate a PKCS10CertificationRequest
	protected PKCS10CertificationRequest generateRequest(KeyPair pair) throws Exception {
		ASN1Set attrSet=null;
		if (!email.equals("")&&email.length()>0){
			GeneralNames subjectAltName = new GeneralNames(new GeneralName(GeneralName.rfc822Name,email));
			Vector oids = new Vector();
			Vector values = new Vector();
			oids.add(X509Extensions.SubjectAlternativeName);
			values.add(new X509Extension(false, new DEROctetString(subjectAltName)));
			X509Extensions extensions = new X509Extensions(oids, values);
			Attribute attribute = new Attribute(PKCSObjectIdentifiers.pkcs_9_at_extensionRequest,
			    new DERSet(extensions));
			attrSet=new DERSet(attribute);
		}
		return new PKCS10CertificationRequest("SHA256withRSA", new X500Principal(
				subjectStr), pair.getPublic(), attrSet, pair.getPrivate());
	}
	
	// This method Creating a Certificate from a Certification Request and rootCert
	protected X509Certificate buildChain(X509Certificate rootCert,PrivateKey rootPriKey,
			PKCS10CertificationRequest request) throws Exception {
		X509V3CertificateGenerator certGen = new X509V3CertificateGenerator();

		certGen.setSerialNumber(BigInteger.valueOf(System.currentTimeMillis()));
		certGen.setIssuerDN(rootCert.getSubjectX500Principal());
		certGen.setNotBefore(new Date(beginDate));
		certGen.setNotAfter(new Date(endDate));
		certGen.setSubjectDN(request.getCertificationRequestInfo().getSubject());
		certGen.setPublicKey(request.getPublicKey("BC"));
		certGen.setSignatureAlgorithm("SHA256WithRSAEncryption");

		certGen.addExtension(X509Extensions.AuthorityKeyIdentifier, false,
				new AuthorityKeyIdentifierStructure(rootCert));
		certGen.addExtension(X509Extensions.SubjectKeyIdentifier,
				false, new SubjectKeyIdentifierStructure(request.getPublicKey("BC")));
		
		certGen.addExtension(X509Extensions.KeyUsage, true, new KeyUsage(KeyUsage.cRLSign
				| KeyUsage.dataEncipherment | KeyUsage.digitalSignature | KeyUsage.keyAgreement
				| KeyUsage.keyCertSign | KeyUsage.keyEncipherment | KeyUsage.nonRepudiation));
		certGen.addExtension(X509Extensions.ExtendedKeyUsage, true, new ExtendedKeyUsage(
				KeyPurposeId.anyExtendedKeyUsage));

		ASN1Set attributes = request.getCertificationRequestInfo().getAttributes();
		if (attributes!=null){
			for (int i = 0; i != attributes.size(); i++) {
				Attribute attr = Attribute.getInstance(attributes.getObjectAt(i));
				if (attr.getAttrType().equals(PKCSObjectIdentifiers.pkcs_9_at_extensionRequest)) {
					X509Extensions extensions = X509Extensions.getInstance(attr.getAttrValues().getObjectAt(0));
					Enumeration e = extensions.oids();
					while (e.hasMoreElements()) {
						DERObjectIdentifier oid = (DERObjectIdentifier) e.nextElement();
						X509Extension ext = extensions.getExtension(oid);
						certGen.addExtension(oid, ext.isCritical(), ext.getValue().getOctets());
					}
				}
			}
		}
		X509Certificate issuedCert = certGen.generateX509Certificate(rootPriKey);
		return issuedCert ;
	}
	
	//This method import a PEM form File,Return a Object
	protected Object PEMStringToObj(String PEMStr) throws Exception {
		InputStream is =new ByteArrayInputStream(PEMStr.getBytes());
	    PEMReader pemReader = new PEMReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	    Object obj=pemReader.readObject();
	    pemReader.close();
	    return obj;
	}
	
	// This method export a Object to a file in PEM form
	protected void ExportPEMFile(Object obj, String path) throws Exception {
			File file=new File(path);
			FileOutputStream os = new FileOutputStream(file);
			// Write in PEM form
			PEMWriter pemWrt = new PEMWriter(new OutputStreamWriter(os, Charset.forName("UTF-8")));
			pemWrt.writeObject(obj);
			pemWrt.close();
			os.close();
	}
	
	//This method import a PEM form File,Return a Object
	protected Object ImportPEMFile(String FilePath) throws Exception {
	    FileInputStream fileStream = new FileInputStream(FilePath);
	    PEMReader pemReader = new PEMReader(new InputStreamReader(fileStream, Charset.forName("UTF-8")));
	    Object obj=pemReader.readObject();
	    pemReader.close();
	    return obj;
	}

}
