package com.bitebooking.exception;
public class ConflictDeleteException extends RuntimeException {

    public ConflictDeleteException(String message) {
        super(message);
    }
}