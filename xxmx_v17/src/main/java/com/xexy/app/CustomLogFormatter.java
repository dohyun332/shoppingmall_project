package com.xexy.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.LogRecord;

public class CustomLogFormatter extends Formatter {
    @Override
    public String format(LogRecord record) {
        StringBuffer buf = new StringBuffer(1000);

        buf.append(calcDate(record.getMillis()));

        buf.append(" [");
        buf.append(record.getLevel());
        buf.append("] ");

        buf.append(" [");
        buf.append(record.getSourceClassName());
        buf.append(".");
        buf.append(record.getSourceMethodName());
        buf.append("(line:");
        buf.append(record.getSequenceNumber());
        buf.append(")");
        buf.append("] ");

        buf.append(" - ");
        buf.append(record.getMessage());
        buf.append("\n");

        return buf.toString();
    }

    private String calcDate(long millis) {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Date date = new Date(millis);
        return fmt.format(date);
    }

    @Override
    public String getHead(Handler h) {
        return "START LOG\n";
    }

    @Override
    public String getTail(Handler h) {
        return "END LOG\n";
    }


}
