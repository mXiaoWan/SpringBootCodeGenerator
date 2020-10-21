package ${packageName}.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xiaomi.nrme.market.common.vo.PageResp;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.service.${classInfo.className}Service;
import ${packageName}.mapper.${classInfo.className}Mapper;
import ${packageName}.entity.${classInfo.className};

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

	@Resource
	private ${classInfo.className}Mapper ${classInfo.className?uncap_first}Mapper;


	@Override
	public Long insert(${classInfo.className} ${classInfo.className?uncap_first}) {

		// valid
		if (${classInfo.className?uncap_first} == null) {
			return -1L;
        }

		Long ret = ${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});
        return ret;
	}


	@Override
	public Long delete(Long id) {
		Long ret = ${classInfo.className?uncap_first}Mapper.delete(id);
		return ret;
	}


	@Override
	public Long update(${classInfo.className} ${classInfo.className?uncap_first}) {
		Long ret = ${classInfo.className?uncap_first}Mapper.update(${classInfo.className?uncap_first});
		return ret;
	}


	@Override
	public ${classInfo.className} load(Long id) {
		return ${classInfo.className?uncap_first}Mapper.getById(id);
	}

	@Override
	public List<${classInfo.className}> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO){
		List<${classInfo.className}> ${classInfo.className?uncap_first}s = ${classInfo.className?uncap_first}Mapper.pageList(${classInfo.className?uncap_first}PageableVO);
		return ${classInfo.className?uncap_first}s;
	}

	@Override
	public PageResp<${classInfo.className}> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO){
		PageHelper.startPage(${classInfo.className?uncap_first}PageableVO.getPageNum(), ${classInfo.className?uncap_first}PageableVO.getPageSize());
		List<${classInfo.className}> ${classInfo.className?uncap_first}s = ${classInfo.className?uncap_first}Mapper.pageList(${classInfo.className?uncap_first}PageableVO);
		Page<${classInfo.className}> page = (Page<${classInfo.className}>) ${classInfo.className?uncap_first}s;
		PageResp<${classInfo.className}> pageResp = new PageResp<>(page.getPageNum(), page.getPageSize()
		, page.getTotal(), page.getResult());
		return pageResp;
	}

}
