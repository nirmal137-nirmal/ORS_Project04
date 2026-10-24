<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Account</title>
</head>
<body>

	<%@ include file="Header.jsp"%>

	<h2 align="center">Bank Account Registration</h2>

	<form action="BankCtl" method="post">

		<table align="center" cellpadding="8">

			<tr>
				<td>Account Number</td>
				<td><input type="number" name="accountNo" required></td>
			</tr>

			<tr>
				<td>Account Holder Name</td>
				<td><input type="text" name="holderName" required></td>
			</tr>

			<tr>
				<td>Account Type</td>
				<td><select name="accountType" required>
						<option value="">Select Account Type</option>
						<option value="Saving">Saving</option>
						<option value="Current">Current</option>
				</select></td>
			</tr>

			<tr>
				<td>Balance</td>
				<td><input type="number" name="balance" step="0.01" min="0"
					required></td>
			</tr>

			<tr>
				<td>Branch</td>
				<td><input type="text" name="branch" required></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="operation" value="Save"> <input type="reset"
					value="Reset"></td>
			</tr>

		</table>

	</form>

</body>
</html>

