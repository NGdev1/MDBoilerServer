package com.md.mdboiler.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.Map;

/** Created by apple on 09.02.2018. */
public class Utils {
  public static boolean isAjax(HttpServletRequest request) {
    return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
  }

  public static Map<String, String> getSuccessMap() {
    LinkedHashMap<String, String> map = new LinkedHashMap<>();
    map.put("status", "ok");
    return map;
  }
}
