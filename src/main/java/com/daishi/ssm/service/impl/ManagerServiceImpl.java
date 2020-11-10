package com.daishi.ssm.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.daishi.ssm.dao.ManagerModelMapper;
import com.daishi.ssm.pojo.ManagerModel;
import com.daishi.ssm.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerModelMapper mapper;

    @Override
    public ManagerModel login(ManagerModel ml) {
        ManagerModel m = mapper.selectfindByName(ml);

        return m;
    }

    @Override
    public void updataManagerPassword(ManagerModel manager) {
        // TODO Auto-generated method stub
        mapper.updateByPrimaryKey(manager);

    }

    public ManagerModel fileUpLoad(MultipartFile ml, ManagerModel manager) throws IOException {

        ResourceBundle bd = ResourceBundle.getBundle("url");
        String path = bd.getString("img.url");

        //获取文件名称
        String name = ml.getOriginalFilename();

        System.out.println("name=" + name);

        String fullPath = path + name;
        System.out.println("fullPath=" + fullPath);
        File f = new File(fullPath);
        //如果文件不存在，就创建
        if (!f.exists()) {
            f.createNewFile();
        }
        ml.transferTo(f);

        String path1 = "/page/images/touxiang/";
        String fullPath1 = path1 + name;

        System.out.println("fullPath1=" + fullPath1);
        manager.setUrl(fullPath1);
        mapper.updateByPrimaryKey(manager);
        return manager;
    }
}
