package ${packageName}.api.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import ${packageName}.common.vo.Pageable;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Data
@ApiModel("${classInfo.classComment}modelPageVo")
public class ${classInfo.className}PageableVO  extends Pageable implements Serializable {

    private static final long serialVersionUID = 1L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    /**
    * ${fieldItem.fieldComment}
    */
    @ApiModelProperty("${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

</#list>
</#if>

}
