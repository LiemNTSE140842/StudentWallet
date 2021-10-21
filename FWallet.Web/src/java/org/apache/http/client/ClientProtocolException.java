package org.apache.http.client;

import java.io.IOException;

public class ClientProtocolException extends IOException {

    private static final long serialVersionUID = -5596590843227115865L;

    public ClientProtocolException() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial java/io/IOException."<init>":()V
         * 4: return
         *  */
        // </editor-fold>
    }

    public ClientProtocolException(String s) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: invokespecial java/io/IOException."<init>":(Ljava/lang/String;)V
         * 5: return
         *  */
        // </editor-fold>
    }

    public ClientProtocolException(Throwable cause) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial java/io/IOException."<init>":()V
         * 4: aload_0
         * 5: aload_1
         * 6: invokevirtual org/apache/http/client/ClientProtocolException.initCause:(Ljava/lang/Throwable;)Ljava/lang/Throwable;
         * 9: pop
         * 10: return
         *  */
        // </editor-fold>
    }

    public ClientProtocolException(String message, Throwable cause) {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: aload_1
         * 2: invokespecial java/io/IOException."<init>":(Ljava/lang/String;)V
         * 5: aload_0
         * 6: aload_2
         * 7: invokevirtual org/apache/http/client/ClientProtocolException.initCause:(Ljava/lang/Throwable;)Ljava/lang/Throwable;
         * 10: pop
         * 11: return
         *  */
        // </editor-fold>
    }
}
