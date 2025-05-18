package com.medikhoj.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {

    public static void addCookie(HttpServletResponse response, String name, String value, int ageInSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        cookie.setMaxAge(ageInSeconds);
        response.addCookie(cookie);
    }

    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) return null;

        for (Cookie c : cookies) {
            if (c.getName().equals(name)) {
                return c.getValue();
            }
        }
        return null;
    }

//    public static void removeCookie(HttpServletResponse response, String name) {
//        addCookie(response, name, "", 0);
//    }
    public static void deleteCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/"); // Make cookie available to the entire application
        response.addCookie(cookie);
    }
}
