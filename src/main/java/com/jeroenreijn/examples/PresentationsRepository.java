package com.jeroenreijn.examples;

import java.util.Collection;

import com.jeroenreijn.examples.model.Presentation;

public interface PresentationsRepository {

    Collection<Presentation> findAll();

    Presentation findPresentation(Long id);

}