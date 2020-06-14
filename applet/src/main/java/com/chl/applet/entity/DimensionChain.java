package com.chl.applet.entity;

public class DimensionChain {
 private String description;
 private Float max;
 private Float min;
 private Float tol;
 private Float mean;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getMax() {
        return max;
    }

    public void setMax(Float max) {
        this.max = max;
    }

    public Float getMin() {
        return min;
    }

    public void setMin(Float min) {
        this.min = min;
    }

    public Float getTol() {
        return tol;
    }

    public void setTol(Float tol) {
        this.tol = tol;
    }

    public Float getMean() {
        return mean;
    }

    public void setMean(Float mean) {
        this.mean = mean;
    }
}
