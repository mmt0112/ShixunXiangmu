package com.byh.biyesheji.filter;

import org.apache.shiro.web.filter.PathMatchingFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 后台登陆状态权限拦截验证（暂未启用，待Service层完成后启用）
 */
public class URLPathMatchingFilter extends PathMatchingFilter {

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)
            throws Exception {
        // TODO: 待 PermissionService 完成后启用完整权限校验功能
        // 暂时全部放行，不影响项目正常运行
        return true;
    }

}