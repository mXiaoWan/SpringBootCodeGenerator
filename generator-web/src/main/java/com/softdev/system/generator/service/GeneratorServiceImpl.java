package com.softdev.system.generator.service;

import ch.qos.logback.core.util.FileUtil;
import com.alibaba.fastjson.JSON;
import com.softdev.system.generator.entity.ClassInfo;
import com.softdev.system.generator.entity.TemplateConfig;
import com.softdev.system.generator.util.FreemarkerUtil;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.stream.Collectors;

/**
 * GeneratorService
 *
 * @author zhengkai.blog.csdn.net
 */
@Slf4j
@Service
public class GeneratorServiceImpl implements GeneratorService {

    @Autowired
    private FreemarkerUtil freemarkerTool;

    String templateCpnfig = null;

    /**
     * 从项目中的JSON文件读取String
     *
     * @author zhengkai.blog.csdn.net
     */
    public String getTemplateConfig() throws IOException {
        templateCpnfig = null;
        if (templateCpnfig != null) {
        } else {
            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("template.json");
            templateCpnfig = new BufferedReader(new InputStreamReader(inputStream))
                    .lines().collect(Collectors.joining(System.lineSeparator()));
            inputStream.close();
        }
        //log.info(JSON.toJSONString(templateCpnfig));
        return templateCpnfig;
    }

    /**
     * 根据配置的Template模板进行遍历解析，得到生成好的String
     *
     * @author zhengkai.blog.csdn.net
     */
    @Override
    public Map<String, String> getResultByParams(Map<String, Object> params) throws IOException, TemplateException {
        Map<String, String> result = new LinkedHashMap<>(32);
        result.put("tableName", params.get("tableName") + "");
        List<TemplateConfig> templateConfigList = JSON.parseArray(getTemplateConfig(), TemplateConfig.class);
        for (TemplateConfig item : templateConfigList) {
            result.put(item.getName(), freemarkerTool.processString(item.getGroup() + "/" + item.getName() + ".ftl", params));
        }
        return result;
    }

    @Override
    public Map<String, String> getResultByParamsToFile(Map<String, Object> params) throws IOException, TemplateException {
//        Map<String, String> result = new LinkedHashMap<>(32);
//        result.put("tableName", params.get("tableName") + "");
//        List<TemplateConfig> templateConfigList = JSON.parseArray(getTemplateConfig(), TemplateConfig.class);
//        for (TemplateConfig item : templateConfigList) {
//            result.put(item.getName(), freemarkerTool.processString(item.getGroup() + "/" + item.getName() + ".ftl", params));
//        }
//        return result;
        Map<String, String> resultByParams = getResultByParams(params);
        ClassInfo classInfo = (ClassInfo) params.get("classInfo");

//        String packageName = adapter.getPackageName(config, tableInfo);
        String packageName = (String) params.get("packageName");
        String basePath = getBasePath(packageName);
        List<TemplateConfig> templateConfigList = JSON.parseArray(getTemplateConfig(), TemplateConfig.class);
        Map<String, TemplateConfig> collect = templateConfigList.stream().collect(Collectors.toMap(TemplateConfig::getName, Function.identity()));
        List<String> keys = new ArrayList<>();
        keys.add("controller");
        keys.add("service");
        keys.add("service_impl");
        keys.add("mapper2");
        keys.add("model");
        keys.add("modelPageVo");
        keys.add("modelVo");
        keys.add("serviceRpc");
        keys.add("serviceRpcImpl");


        for (String key : keys) {
            String code = resultByParams.get(key);
            TemplateConfig templateConfig = collect.get(key);
            String filePackage = templateConfig.getFilePackage();

            String path = (basePath + filePackage)
                    .replaceAll("baseClassName", classInfo.getTableName())
                    .replaceAll("_","\\.")
                    .replaceAll("\\.", Matcher.quoteReplacement(File.separator));

            File file = new File(path);
            if (!file.exists() && !file.isDirectory()) {
                file.mkdirs();
            }
            String className = templateConfig.getClassName();

            String baseClassName = className.replaceAll("baseClassName", classInfo.getClassName());
            File file1 = new File(file, baseClassName + ".java");
            file1.createNewFile();
            FileWriter fileWriter = new FileWriter(file1);
            fileWriter.write(code);
            fileWriter.flush();
            fileWriter.close();
        }

        return null;
    }

    private String getBasePath(String packageName) {
//        String path = "D:\\tmp\\code\\";
        String path = getProjectPath();
        path = path + File.separator + "tmp" + File.separator;
        String resultPath = path + packageName;
        resultPath = resultPath.replaceAll("\\.", Matcher.quoteReplacement(File.separator));
        resultPath += File.separator;
        System.out.println(resultPath);
        return resultPath;
    }

    public static String getProjectPath() {
        return System.getProperty("user.dir");
    }

    public static void main(String[] args) throws Exception {
        HashMap<String, Object> objectObjectHashMap = new HashMap<>();
        objectObjectHashMap.put("packageName", "com.softdev.system.generator");
        GeneratorServiceImpl generatorService = new GeneratorServiceImpl();
        Map<String, String> resultByParamsToFile = generatorService.getResultByParamsToFile(objectObjectHashMap);

        List<TemplateConfig> templateConfigList = JSON.parseArray(generatorService.getTemplateConfig(), TemplateConfig.class);

//        resultByParamsToFile.get()
    }

}
