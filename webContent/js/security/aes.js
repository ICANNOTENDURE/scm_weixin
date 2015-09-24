/**
 * Security V1.0.0
 * AES对CryptoJS v3.1.2中的AES加密的封装
 * (c) 2013 by YuHong
 */

document.writeln('<script src="js/security/CryptoJS/components/core-min.js"></script>');
document.writeln('<script src="js/security/CryptoJS/components/cipher-core-min.js"></script>');
document.writeln('<script src="js/security/CryptoJS/components/pad-zeropadding-min.js"></script>');
document.writeln('<script src="js/security/CryptoJS/components/aes-min.js"></script>');
document.writeln('<script src="js/security/CryptoJS/components/md5-min.js"></script>');
document.writeln('<script src="js/security/CryptoJS/components/enc-base64-min.js"></script>');

var Security = Security || (function (Math, undefined) {
	/**
     * Security namespace.
     */

    var S = {};
    /**
     * Enc namespace.
     */
	var S_ENC=S.enc={};
	var AES=S_ENC.AES={
		cbcEncrypt:function(data,password){
			var key_hash = CryptoJS.MD5(password).toString();
			var key = CryptoJS.enc.Utf8.parse(key_hash.substring(0, 16));
			var iv = CryptoJS.enc.Utf8.parse(key_hash.substring(16, 32));
			var encrypted = CryptoJS.AES.encrypt(data, key, {iv:iv,mode:CryptoJS.mode.CBC,padding:CryptoJS.pad.ZeroPadding});
			var encryptedWord = CryptoJS.enc.Hex.parse(encrypted.ciphertext.toString());
			var base64Str=CryptoJS.enc.Base64.stringify(encryptedWord);
			return base64Str;
		},
		cbcDecrypt:function(base64Str,password){
			var key_hash = CryptoJS.MD5(password).toString();
			var key = CryptoJS.enc.Utf8.parse(key_hash.substring(0, 16));
			var iv = CryptoJS.enc.Utf8.parse(key_hash.substring(16, 32));
			var encryptedWord=CryptoJS.lib.CipherParams.create({
				ciphertext:CryptoJS.enc.Base64.parse(base64Str)
			});
			var decryptedWord=CryptoJS.AES.decrypt(encryptedWord,key,{iv:iv,mode:CryptoJS.mode.CBC,padding:CryptoJS.pad.ZeroPadding});
			
			var plaintext=decryptedWord.toString(CryptoJS.enc.Utf8);
			return plaintext;
		},
		cbcEncrypt:function(data,password,encode){
			var key_hash = CryptoJS.MD5(password).toString();
			var key = CryptoJS.enc.Utf8.parse(key_hash.substring(0, 16));
			var iv = CryptoJS.enc.Utf8.parse(key_hash.substring(16, 32));
			if(encode=="1"){
				data = encodeURIComponent(data);
			}
			var encrypted = CryptoJS.AES.encrypt(data, key, {iv:iv,mode:CryptoJS.mode.CBC,padding:CryptoJS.pad.ZeroPadding});
			var encryptedWord = CryptoJS.enc.Hex.parse(encrypted.ciphertext.toString());
			var base64Str=CryptoJS.enc.Base64.stringify(encryptedWord);
			return base64Str;
		},
		cbcDecrypt:function(base64Str,password,encode){
			var key_hash = CryptoJS.MD5(password).toString();
			var key = CryptoJS.enc.Utf8.parse(key_hash.substring(0, 16));
			var iv = CryptoJS.enc.Utf8.parse(key_hash.substring(16, 32));
			var encrypted=CryptoJS.lib.CipherParams.create({
				ciphertext:CryptoJS.enc.Base64.parse(base64Str)
			});
			var decrypted=CryptoJS.AES.decrypt(encrypted,key,{iv:iv,mode:CryptoJS.mode.CBC,padding:CryptoJS.pad.ZeroPadding});

			var plaintext=decrypted.toString(CryptoJS.enc.Utf8);
			if(encode=="1"){
				plaintext=decodeURIComponent(plaintext);
			}
			return plaintext;
		}
	};
	return S;
}(Math));