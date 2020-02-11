package com.huaweicloud.sdk.iot.device.demo;

import com.huaweicloud.sdk.iot.device.client.requests.CommandRsp;
import com.huaweicloud.sdk.iot.device.service.AbstractService;
import com.huaweicloud.sdk.iot.device.service.DeviceCommand;
import com.huaweicloud.sdk.iot.device.service.Property;
import java.util.Map;
import java.util.Random;
import org.apache.log4j.Logger;

/**
 * This code is generated by FreeMarker
 *
 */
public class ${service.serviceType}Service extends AbstractService
{
    private static Logger log = Logger.getLogger(${service.serviceType}Service.class);
    private Random random = new Random();

    /********** attribute ***********/
<#list service.properties as property>
    @Property(writeable =  ${property.writeable})
    private ${property.javaType} ${property.propertyName};

</#list>


    /********** commands ***********/
<#list service.commands as command>
    @DeviceCommand
    public CommandRsp ${command.commandName} (Map<String, Object> paras) {
      //todo 请在这里添加命令处理代码
      return new CommandRsp(0);
    }

</#list>

    /********** get/set ***********/
<#list service.properties as property>
    public ${property.javaType} get${property.propertyName?cap_first}() {
        //模拟从传感器读取数据
        ${property.propertyName} = ${property.val};
        log.info("report property ${property.propertyName} value =  "+ ${property.propertyName});

        return ${property.propertyName};
    }

    public void set${property.propertyName?cap_first}(${property.javaType} ${property.propertyName}) {
        this.${property.propertyName} = ${property.propertyName};
        log.info("property ${property.propertyName} set to "+ ${property.propertyName});
    }

</#list>

}