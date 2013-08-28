dataSource {
    pooled = true
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "123123a"
}
hibernate {

    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'

    flush.mode='commit'

}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://127.0.0.1:5432/ebmp"
            //logSql = true
        }

//        dataSource_nc {
//            dialect = org.hibernate.dialect.DataDirectOracle9Dialect
//            driverClassName = 'oracle.jdbc.driver.OracleDriver'
//            username = 'ncpos'
//            password = 'ncpos'
//            url = 'jdbc:oracle:thin:@192.168.208.251:1521:ORCL'
//            dbCreate = 'update'
//        }

    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://127.0.0.1:5432/ebmp"

        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/ebmp"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}
