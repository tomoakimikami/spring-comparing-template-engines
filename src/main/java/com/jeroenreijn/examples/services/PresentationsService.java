package com.jeroenreijn.examples.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeroenreijn.examples.PresentationsRepository;
import com.jeroenreijn.examples.model.Presentation;

/**
 * Simple service for fetching presentations.
 * @author Jeroen Reijn
 */
@Service
public class PresentationsService {
    @Autowired
    PresentationsRepository presentationsRepository;

    public Iterable<Presentation> findAll() {
      List<Presentation> list = new ArrayList<>();
      for (int i = 0; i < 10; i++) {
        list.addAll(this.presentationsRepository.findAll());
      }
      return list;
    }
}
