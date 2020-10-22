package ${packageName}.rpc;

import com.xiaomi.data.push.common.Health;
import ${packageName}.api.rpc.service.${classInfo.className}RpcService;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}PageableVO;
import ${packageName}.api.vo.${classInfo.className?uncap_first}.${classInfo.className}VO;
import ${packageName}.common.vo.IdVO;
import ${packageName}.common.vo.PageResp;
import ${packageName}.entity.${classInfo.className};
import ${packageName}.mapper.${classInfo.className}Mapper;
import ${packageName}.service.${classInfo.className}Service;
import com.xiaomi.youpin.infra.rpc.Result;
import com.xiaomi.youpin.qps.QpsAop;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service(timeout = 1000, group = "${dubbo.group}")
@Slf4j
public class ${classInfo.className}RpcServiceImpl implements ${classInfo.className}RpcService {

@Resource
private QpsAop qpsAop;

@Resource
private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    @Override
    public Result<Health> health() {
        long qps = qpsAop.getQps();
        return Result.success(new Health("0.2312.1", "2019-11-11", qps));
    }

    @Override
    public Result<Long> insert(${classInfo.className}VO ${classInfo.className?uncap_first}VO) {
        ${classInfo.className} ${classInfo.className?uncap_first} = new ${classInfo.className}();
        BeanUtils.copyProperties(${classInfo.className?uncap_first}VO, ${classInfo.className?uncap_first});
        Long ret = ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first});
        return Result.success(ret);
    }

    @Override
    public Result<Long> delete(IdVO id) {
        Long ret = ${classInfo.className?uncap_first}Service.delete(id.getId());
        return Result.success(ret);
    }

    @Override
    public Result<Long> update(${classInfo.className}VO ${classInfo.className?uncap_first}VO) {
        ${classInfo.className} ${classInfo.className?uncap_first} = new ${classInfo.className}();
        BeanUtils.copyProperties(${classInfo.className?uncap_first}VO, ${classInfo.className?uncap_first});
        Long ret = ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
        return Result.success(ret);
    }

    @Override
    public Result<${classInfo.className}VO> load(IdVO id) {
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Service.load(id.getId());
        ${classInfo.className}VO ${classInfo.className?uncap_first}VO = new ${classInfo.className}VO();
        BeanUtils.copyProperties(${classInfo.className?uncap_first}, ${classInfo.className?uncap_first}VO);
        return Result.success(${classInfo.className?uncap_first}VO);
    }

    @Override
    public Result<List<${classInfo.className}VO>> list(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO) {
        List<${classInfo.className}> list = ${classInfo.className?uncap_first}Service.list(${classInfo.className?uncap_first}PageableVO);
        ArrayList<${classInfo.className}VO> vos = new ArrayList<>(list.size());
        for (${classInfo.className} ${classInfo.className?uncap_first} : list) {
            ${classInfo.className}VO ${classInfo.className?uncap_first}VO = new ${classInfo.className}VO();
            BeanUtils.copyProperties(${classInfo.className?uncap_first}, ${classInfo.className?uncap_first}VO);
            vos.add(${classInfo.className?uncap_first}VO);
        }
        return Result.success(vos);
    }

    @Override
    public Result<PageResp<${classInfo.className}VO>> pageList(${classInfo.className}PageableVO ${classInfo.className?uncap_first}PageableVO) {
        PageResp<${classInfo.className}> ${classInfo.className?uncap_first}PageResp = ${classInfo.className?uncap_first}Service.pageList(${classInfo.className?uncap_first}PageableVO);
        List<${classInfo.className}> list = ${classInfo.className?uncap_first}PageResp.getData();
        ArrayList<${classInfo.className}VO> vos = new ArrayList<>(list.size());
        for (${classInfo.className} ${classInfo.className?uncap_first} : list) {
            ${classInfo.className}VO ${classInfo.className?uncap_first}VO = new ${classInfo.className}VO();
            BeanUtils.copyProperties(${classInfo.className?uncap_first}, ${classInfo.className?uncap_first}VO);
            vos.add(${classInfo.className?uncap_first}VO);
        }
        PageResp<${classInfo.className}VO> pageResp = new PageResp<>(${classInfo.className?uncap_first}PageResp, vos);
        return Result.success(pageResp);
    }

    @Override
    public Result<Integer> toggleState(IdVO id) {
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Service.load(id.getId());
        ${classInfo.className?uncap_first}.setState((${classInfo.className?uncap_first}.getState() + 1) % 2);
        ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
        return Result.success(${classInfo.className?uncap_first}.getState());
    }
}
