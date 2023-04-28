package com.xexy.app;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.*;


/**
 *  기본자바 logging
 */
public class test {
    static Logger logger = Logger.getLogger(test.class.getName());
    //    static Logger logger = Logger.getGlobal();
    public static void loginChk(String id) {
        if(id.equals("master")) {
            logger.severe("high urgent");
            logger.warning("middle urgent");
            logger.info("low urgent");
        }
    }

    public static void main(String[] args) {
        // 기본로그와 중첩해서 나오지 않도록 기본로그 삭제
        Logger rootLogger = Logger.getLogger("");
        Handler[] handlers = rootLogger.getHandlers();
        if(handlers[0] instanceof ConsoleHandler) rootLogger.removeHandler(handlers[0]);
        //

        logger.setLevel(Level.INFO);
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(cal.getTime());

        File folder = new File("E:/github/백업/2304281004 xxmx_v17_logTest/src/main/resources/log");
        if(!folder.exists()) {
            folder.mkdirs();
        }

        try {
            Handler handler = new FileHandler("E:/github/백업/2304281004 xxmx_v17_logTest/src/main/resources/log/"+ today + " message.log", true);
            CustomLogFormatter fmt = new CustomLogFormatter();
            handler.setFormatter(fmt);
            logger.addHandler(handler);

            logger.severe("severe Log2");
            logger.warning("warning Log2");
            logger.info("info Log2");

        } catch (IOException e) {
            logger.warning(e.getMessage());
        }

        /* 콘솔창에 로그 출력
        logger.setLevel(Level.INFO);

        Handler handler = new ConsoleHandler();
        CustomLogFormatter fmt = new CustomLogFormatter();
        handler.setFormatter(fmt);
        logger.addHandler(handler);

        logger.severe("high urgent");
        logger.warning("middle urgent");
        logger.info("low urgent");
        */
    }
}

