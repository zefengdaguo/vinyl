package com.neila.vinylback.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by neila on 2022/4/20 15:15
 **/


public class FileToHex {
    private static final String NEW_LINE = System.lineSeparator();
    private static final String UNKNOWN_CHARACTER = ".";

    public static void main(String[] args) throws IOException {

        String file = "C:\\Users\\lenovo\\Desktop\\test\\bat.webp";

        String s = convertFileToHex(Paths.get(file));
        System.out.println(s);
//        System.out.println(getHeader(new FileInputStream(file)));
    }

    /**
     * 获取头部的16个字节
     */
    public static String getHeader(InputStream in) throws IOException {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 16 && in.available() > 0; i++) {
            sb.append(String.format("%02x",in.read()));
        }
        return sb.toString();
    }

    public static String convertFileToHex(Path path) throws IOException {

        if (Files.notExists(path)) {
            throw new IllegalArgumentException("File not found! " + path);
        }

        StringBuilder result = new StringBuilder();
        StringBuilder hex = new StringBuilder();
        StringBuilder input = new StringBuilder();

        int count = 0;
        int value;

        // path to inputstream....
        try (InputStream inputStream = Files.newInputStream(path)) {

            while ((value = inputStream.read()) != -1) {

                hex.append(String.format("%02X ", value));

                //If the character is unable to convert, just prints a dot "."
                if (!Character.isISOControl(value)) {
                    input.append((char) value);
                } else {
                    input.append(UNKNOWN_CHARACTER);
                }

                // After 15 bytes, reset everything for formatting purpose
                if (count == 14) {
                    result.append(String.format("%-60s | %s%n", hex, input));
                    hex.setLength(0);
                    input.setLength(0);
                    count = 0;
                } else {
                    count++;
                }

            }

            // if the count>0, meaning there is remaining content
            if (count > 0) {
                result.append(String.format("%-60s | %s%n", hex, input));
            }

        }

        return result.toString();
    }
}
