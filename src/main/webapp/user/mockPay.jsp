<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>模拟支付 - 易宝支付</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .payment-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .payment-header h2 {
            color: #333;
        }
        .payment-info {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        .payment-info table {
            width: 100%;
        }
        .payment-info td {
            padding: 10px;
        }
        .payment-info .label {
            font-weight: bold;
            width: 150px;
        }
        .payment-actions {
            text-align: center;
            margin-top: 30px;
        }
        .payment-actions button {
            margin: 0 10px;
            padding: 10px 30px;
            font-size: 16px;
        }
        .bank-info {
            margin: 20px 0;
            padding: 15px;
            background-color: #e3f2fd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <div class="payment-header">
            <h2>易宝支付 - 收银台</h2>
            <p style="color: #666;">安全支付，保障您的资金安全</p>
        </div>
        
        <div class="payment-info">
            <table>
                <tr>
                    <td class="label">订单编号：</td>
                    <td>${sessionScope.orderId}</td>
                </tr>
                <tr>
                    <td class="label">支付金额：</td>
                    <td style="color: #ff6600; font-weight: bold;">¥0.01</td>
                </tr>
                <tr>
                    <td class="label">支付方式：</td>
                    <td>
                        <% 
                            String bank = (String) session.getAttribute("bank");
                            if (bank != null) {
                                if (bank.contains("ICBC")) {
                                    out.print("工商银行");
                                } else if (bank.contains("CCB")) {
                                    out.print("建设银行");
                                } else if (bank.contains("ABC")) {
                                    out.print("农业银行");
                                } else if (bank.contains("BOC")) {
                                    out.print("中国银行");
                                } else {
                                    out.print("网上银行");
                                }
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td class="label">商户名称：</td>
                    <td>石家庄文旅网</td>
                </tr>
            </table>
        </div>
        
        <div class="bank-info">
            <h4>银行支付界面</h4>
            <form action="/mockPayResult" method="post">
                <input type="hidden" name="orderId" value="${sessionScope.orderId}">
                <div class="form-group">
                    <label for="cardNumber">银行卡号：</label>
                    <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="请输入16-19位数字" required>
                </div>
                <div class="form-group">
                    <label for="password">密码：</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入6位数字" required>
                </div>
                <div class="form-group">
                    <label for="verifyCode">验证码：</label>
                    <input type="text" id="verifyCode" name="verifyCode" class="form-control" placeholder="请输入4位数字" required>
                </div>
                <div class="payment-actions">
                    <button type="submit" name="result" value="success" class="btn btn-success">
                        支付成功
                    </button>
                    <button type="submit" name="result" value="fail" class="btn btn-danger">
                        支付失败
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>