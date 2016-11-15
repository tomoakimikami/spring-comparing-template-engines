package com.jeroenreijn.examples;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class RequestTimeCountFilter extends OncePerRequestFilter {

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
      FilterChain filterChain) throws ServletException, IOException {
    final long begin = System.currentTimeMillis();
    try {
      filterChain.doFilter(request, response);
    } finally {
      logger.info(String.format("diff:%d ms, uri:%s", System.currentTimeMillis() - begin, request.getRequestURI()));
    }
  }

}
