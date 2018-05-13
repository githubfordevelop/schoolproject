var PwdStrength = (function ($) {

    //var confirmPwdInfo = "确认密码和新密码保持一致";
    //var nonePwdMsg = "密码不能为空";
    var strength = function (opt) {

        this.params = {
            pwd_id: '',     // 控件密码框绑定的元素ID
            confirm_pwd_id: '',     // 控件重复密码框绑定的元素ID
            pwdPolicy: "1",     // 密码策略，默认为1  对应弱密码
            strongPwdLeastKinds: '3',  // 强密码最少的字符种类
            mediumPwdLeastKinds: '2',   // 中度密码最少的字符种类
            lowPwdLeastKinds: '1',   // 弱密码最少的字符种类
            strongPwdLeastLength: '12',  // 强密码最少的字符长度
            mediumPwdLeastLength: '9',  // 中密码最少的字符长度
            lowPwdLeastLength: '6'  // 弱密码最少的字符长度
        };
        copyPropertyVal(opt, this.params);
        this.init();
        this.bindEvent();
    };

    strength.prototype = {
        init: function (){
            var msg = getPolicyMsg(this.params);
            $("#"+this.params.pwd_id).nextAll(".help_inline").html(msg);
            $("#"+this.params.confirm_pwd_id).nextAll(".help_inline").html(confirmPwdInfo);
        },
        checkPwd: function () {
            var _this = this;
            var pwdValue = $("#" +  _this.params.pwd_id).val();
            if(pwdValue == "" || pwdValue.trim() == ""){
                $("#" +  _this.params.pwd_id).nextAll(".help_inline").html(nonePwdMsg);
                $("#" +  _this.params.pwd_id).parents("tr").removeClass("vail_psw_success").addClass("vail_psw_err");
                return false;
            }

            return checkPwdStrength($("#" +  _this.params.pwd_id),_this.params);
        },
        checkConfirmPwd:function(){
            var _this = this;
            var confirmPwdId =  _this.params.confirm_pwd_id;
            var confirmPwdValue = $("#" + confirmPwdId).val();
            if(confirmPwdValue == "" || confirmPwdValue.trim() == ""){
                $("#" +  confirmPwdId).nextAll(".help_inline").html(nonePwdMsg);
                $("#" +  confirmPwdId).parents("tr").removeClass("vail_psw_success").addClass("vail_psw_err");
                return;
            }

            var pwdValue = $("#" +  _this.params.pwd_id).val();
            if(confirmPwdValue != pwdValue){
                $("#" +  confirmPwdId).nextAll(".help_inline").html(confirmPwdInfo);
                $("#" +  confirmPwdId).parents("tr").removeClass("vail_psw_success").addClass("vail_psw_err");
                return false;
            }

            return checkPwdStrength( $("#" +  confirmPwdId),_this.params);
        },
        bindEvent: function () {
            var _this = this;

            $("#" +  _this.params.pwd_id).blur(function () {
                _this.checkPwd();
            });

            $("#" + _this.params.confirm_pwd_id).blur(function () {
                _this.checkConfirmPwd();
            });
        }

    };

    return strength;

    /**
     * 参数复制
     * @param from
     * @param to
     */
    function copyPropertyVal(from, to) {
        for (var f in from) {
            for (var t in to) {
                if (f == t && from[f] != null) {
                    to[t] = from[f];
                    break;
                }
            }
        }
    }

    /**
     *
     * @param val 需要判断的字符串
     * @return 1:弱   2:中   3:强
     *
     */
    function getPasswordStrength(val, pramas) {
        var strongPwdLeastKinds = pramas.strongPwdLeastKinds;
        var mediumPwdLeastKinds = pramas.mediumPwdLeastKinds;
        var lowPwdLeastKinds = pramas.lowPwdLeastKinds;
        var strongPwdLeastLength = pramas.strongPwdLeastLength;
        var mediumPwdLeastLength = pramas.mediumPwdLeastLength;
        var lowPwdLeastLength = pramas.lowPwdLeastLength;
        var level = 0;
        var charTypes = getCharTypes(val);
        var valLength = val.length;

//        alert(charTypes+"--"+valLength);

        // 如果符合弱密码强度，那么 强度为1
        if (charTypes >= lowPwdLeastKinds && valLength >= lowPwdLeastLength) {
            level = 1;
        }

        // 如果符合中级密码强度   那么强度为2
        if (charTypes >= mediumPwdLeastKinds && valLength >= mediumPwdLeastLength) {
            level = 2;
        }

        // 如果符合高强度密码强度   那么强度为3
        if (charTypes >= strongPwdLeastKinds && valLength >= strongPwdLeastLength) {
            level = 3;
        }

        return level;
    }

    // 获取字符串的字符种类
    function getCharTypes(val) {
        var typesNum = 0;
        if (val.match(/[a-z]/g)) {
            typesNum++;
        }
        if (val.match(/[A-Z]/g)) {
            typesNum++;
        }
        if (val.match(/[0-9]/g)) {
            typesNum++;
        }
        if (val.match(/(.[^a-zA-Z0-9])/g)) {
            typesNum++;
        }
        return typesNum;
    }


    // 校验密码是否符合
    function checkPwdStrength(obj, _params) {

        var val = $(obj).val();
        var pwdStrength = getPasswordStrength(val, _params);
        var result = true;
        //  密码强度比策略低的时候，返回false
        if (pwdStrength < _params.pwdPolicy ) {
            result = false;
        }
        var msg = getPolicyMsg(_params);
        $(obj).nextAll(".help_inline").html(msg);
        if(result){
            // 成功
            $(obj).parents("tr").removeClass("vail_psw_err").addClass("vail_psw_success");
            return true;
        }else{
            // 失败
            $(obj).parents("tr").removeClass("vail_psw_success").addClass("vail_psw_err");
            return false;
        }

    }

    // 获取密码策略对应的说明文字
    function getPolicyMsg(_params){
        var pwdPolicy = _params.pwdPolicy;
        //var msg = "密码长度至少length位；字符种类至少kind种（(数字，大写字母，小写字母，标点符号）。";
        if (pwdPolicy == 1) {
            pwdPolicyMsg = pwdPolicyMsg.replace("pwdLength", _params.lowPwdLeastLength).replace("pwdKind", _params.lowPwdLeastKinds);
        } else if (pwdPolicy == 2) {
            pwdPolicyMsg = pwdPolicyMsg.replace("pwdLength", _params.mediumPwdLeastLength).replace("pwdKind", _params.mediumPwdLeastKinds);
        } else if (pwdPolicy == 3) {
            pwdPolicyMsg = pwdPolicyMsg.replace("pwdLength", _params.strongPwdLeastLength).replace("pwdKind", _params.strongPwdLeastKinds);
        }
        return pwdPolicyMsg;
    }
}(jQuery));