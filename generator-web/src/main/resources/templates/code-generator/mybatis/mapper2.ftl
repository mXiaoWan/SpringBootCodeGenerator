package ${packageName}.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.entity.${classInfo.className};

/**
 * @description ${classInfo.classComment}Mapper
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Mapper
@Repository
public interface ${classInfo.className}Mapper {

    @Select("select * from ${classInfo.prefixTableName}${classInfo.tableName} where id=井{id}")
    public ${classInfo.className} getById(Long id);

    @Options(useGeneratedKeys=true,keyProperty="id")
    @Insert("insert into ${classInfo.prefixTableName}${classInfo.tableName}" +
            " (<#list classInfo.fieldList as fieldItem >${fieldItem.columnName}<#if fieldItem_has_next>,</#if></#list>)" +
            " values(<#list classInfo.fieldList as fieldItem >${fieldItem.fieldName}<#if fieldItem_has_next>,<#else>)</#if></#list>")
    public Long insert(${classInfo.className} ${classInfo.className?uncap_first});

    @Delete(value = "delete from ${classInfo.prefixTableName}${classInfo.tableName} where id=井{id}")
    Long delete(Long id);

    @Update(value = "update ${classInfo.prefixTableName}${classInfo.tableName} set "
    <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.columnName != "id">+" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next>,</#if>"</#if>
    </#list>
        +" where id=井{id} ")
    Long update(${classInfo.className} ${classInfo.className?uncap_first});


    @Results(value = {
    <#list classInfo.fieldList as fieldItem >
        @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
    </#list>
    })
    @Select(value = "select * from ${classInfo.prefixTableName}${classInfo.tableName} where id=井{id}")
    ${classInfo.className} selectOne(Long id);

    @Results(value = {
    <#list classInfo.fieldList as fieldItem >
        @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
    </#list>
    })
    @Select(value = "select * from ${classInfo.prefixTableName}${classInfo.tableName} where 1=1  "
    <#list classInfo.fieldList as fieldItem >
         +"AND ${fieldItem.columnName}=井{${fieldItem.fieldName}}"
    </#list>
    )
    List<${classInfo.className}> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);


    @Results(value = {
    <#list classInfo.fieldList as fieldItem >
        @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
    </#list>
    })
    @Select(value = "select * from ${classInfo.prefixTableName}${classInfo.tableName} where 1=1  "
    <#list classInfo.fieldList as fieldItem >
        // +" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next> or </#if>"
    </#list>
    )
    List<${classInfo.className}> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO);

}