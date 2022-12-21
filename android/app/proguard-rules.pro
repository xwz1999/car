#-keep class com.alipay.deviceid.** { *; }
#-keep class net.security.device.api.** {*;}
#-keep class org.json.** { *;}
#-keep class com.alibaba.fastjson.** {*;}
#-keep class com.alibaba.sdk.android.oss.** { *; }
#
#-dontwarn okio.**
#-dontwarn org.apache.commons.codec.binary.**
#
#-keepclassmembers,allowobfuscation class * {
#@com.alibaba.fastjson.annotation.JSONField <fields>;
#}