package main.java;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.Buffer;
import java.nio.CharBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;

/**
 * @author tangzhihai
 * @date 2019/3/17
 */
public class Filechannel {
    public static void main(String[] args) throws  Exception{
        File file=new File("E:\\software\\Java_project\\ssmdemo\\src\\" +
                "main\\java\\com\\tang\\blog\\controller\\AdminController.java");
        FileChannel filechannel=new FileInputStream(file).getChannel();
        FileChannel fileC=new FileOutputStream("E:\\software\\Java_project\\channel.txt").getChannel();
            MappedByteBuffer mappedByteBuffer=filechannel.map(FileChannel.MapMode.READ_ONLY,0,file.length());
            Charset charset=Charset.forName("UTF-8");
            fileC.write(mappedByteBuffer);
            mappedByteBuffer.clear();
            CharsetDecoder charsetDecoder=charset.newDecoder();
            CharBuffer charBuffer=charsetDecoder.decode(mappedByteBuffer);
            System.out.println(""+charBuffer);



    }
}
