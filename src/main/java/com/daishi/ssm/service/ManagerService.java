package com.daishi.ssm.service;

import com.daishi.ssm.pojo.ManagerModel;


public interface ManagerService {
    ManagerModel login(ManagerModel ml);

    public void updataManagerPassword(ManagerModel manager);

}
