package com.dhcc.framework.common;

public class EnumConstants {

	public enum RelaTypeEnum{
		
		one2one(0),//一对一关联
		one2manyList(1), //一对多一方中拥有多方的list
		one2manySet(2),  //一对多一方中拥有多方的set 
		many2manyList(3),//对对多 list
		many2manySet(4);//对对多set
		private final int relaType;
		private RelaTypeEnum(int relaType){
			this.relaType = relaType;
		}
		
		public int getRelaType() {
			return relaType;
		}

	}
}
