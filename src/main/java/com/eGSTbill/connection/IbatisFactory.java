package com.eGSTbill.connection;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.*;
import java.sql.SQLException;

public class IbatisFactory {
   public SqlMapClient getSession()throws IOException,SQLException{
      Reader rd = Resources.getResourceAsReader("com/eGSTbill/connection/SqlMapConfig.xml");
      SqlMapClient sqlMap = SqlMapClientBuilder.buildSqlMapClient(rd);
      return sqlMap;
   }
} 