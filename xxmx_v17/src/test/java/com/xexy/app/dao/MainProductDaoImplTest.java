package com.xexy.app.dao;

import com.xexy.app.domain.MainProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MainProductDaoImplTest {

    @Autowired
    MainProductDao mpd;

    @Test
    public void reviewCnt() {
    }

    @Test
    public void selectAllBest() {
        List<MainProductDto> list =  mpd.selectAllBest();
        for(MainProductDto mpd:list) {
            System.out.println(mpd);
        }
    }

    @Test
    public void selectBest() {
    }

    @Test
    public void selectAllHits() {
    }

    @Test
    public void selectCate() {
    }
}