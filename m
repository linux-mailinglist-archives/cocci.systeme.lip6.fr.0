Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB319A7F0
	for <lists+cocci@lfdr.de>; Wed,  1 Apr 2020 10:55:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0318tJxf028267;
	Wed, 1 Apr 2020 10:55:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B94BC782D;
	Wed,  1 Apr 2020 10:55:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6650566CB
 for <cocci@systeme.lip6.fr>; Wed,  1 Apr 2020 10:55:17 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0318tGPE029202
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Wed, 1 Apr 2020 10:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585731314;
 bh=e0c47/KWEObJgbvDl4+U26/brnt7w5vynCBkVshiUqQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=KkGf+nplcE6lAnCKBTcIQxppbehHDvZi9HRBT1gPcpLEyBc45syZKS1Pfwy8qryDZ
 rHG9RI3SCTk5ciofbxup3iPuSZ/wRDx35me3zBcZVX0amRUvNSKFY22dZpMxkKltrC
 AOazcUHQ2dcFgPRA9WPA87ni9ZcWgLDtaPlZuWbc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.45.194]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MgfXb-1jfCKr190x-00NwOF; Wed, 01
 Apr 2020 10:55:14 +0200
To: Joe Perches <joe@perches.com>
References: <d4d9bd0a-6bbf-3557-0726-e46cde5c8e2e@web.de>
 <b3c46f05b9341d06ad9f0c04f15918102e938c96.camel@perches.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <69f2fabe-252c-1e7b-3ab5-3a1f72a73d98@web.de>
Date: Wed, 1 Apr 2020 10:55:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b3c46f05b9341d06ad9f0c04f15918102e938c96.camel@perches.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Aj86WJrh4w8ehiEGnSBRuGWQiIWEpVcQcmgM1Mgy3PaYrH+k09n
 azhfPHOJlydSZGfAQ774wFe6FwQ0ALZzv1cW5DeYqkHw+v8esrqoYmzlN3Kc4uBhgIKwf1D
 yHA/Kwb/dj4Euvq+c+Lr669634H51YKGz5fkYG0wtHhoehaDKZ567Run0ybn8c0O64BGSs6
 J52W74eFBZgU0GlZ71P/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WbljYEDI/kY=:4HzaJTI6F3u6HVe5Ur6LQC
 vjonjREJA7oK1ZFj94/0lCOEMwTFu0lkJdUwHNKx3rjrvqJNrayABgZfQGy3EiuqZdgGxAoRL
 axfqBZiXB2tFqREjXb24Z28kS/XnkWxlCLFVkyvYH5X7AIJm7BC/A3iDXsRqBU6SdHvn+6xyO
 2WxxAEmczzKKzPVw9n7KOAMZId83AlpzPDrOtKublewe9c7kd8heJ5dv1XwY9UB8Yz/3+P8au
 G6V9qalsKfYZfs2zJqFyEi42pILt+DcTaIQXda/Jn7C9iM34yilZEJwCrkQ7mp7/oX5Lp9P+L
 297Wg6ZV7eG6122TzRCj/4vwBhef7CWA8hMNXX3AgBDAjbSUIfH7ssgCsd+lP37HbPoHgOp0z
 VzynDdHZRGKmd7/rtFrs2mfaTSR2kw2PO84DlHawLWKR7H4ltd+D3WJ9VYNRF+aU9h3CvDZ/c
 mM6EiqfNVG3OtKZKvmylAIEoJ41N+X37hgcqQbywHhe4pgR4y7waButfu4wd2vhvYaFdUJQqY
 OuekKFC2aWaxVb+p4fwlhStSDsVcuZJhddbbh/VMNOsDVIR2V9PKqzmwstVL0gD4L1cwEJnO9
 ikbI0utsrPiWcKXjpyM5lt1mvJhJG6PozSlRI0Lip9SSPnZWtghcdZTn1ysYiJ//EY3g//vZT
 lbdBAg8VOej42IM1+6Eg/pp3DAtpXsMGkbBcrxy+oYlQYEeiCkg1z/Pnl5zzeKA3eXpHoLsCs
 WN31PLzaBOZ7DtAQXADXrccMYIHUwics4BNQhdnActh73qPFph99weXuhnnKpaoB4e60F/fpj
 NCW15zlDxKjXQeQUAiMCx2L+wWGdWFxixkLaHQl9koyz0WVPhuDZPOHqk1Yet/rFtVoTbkuJC
 4WXHBTGQ2HCZns5JZDu9JWAzClzPs0Vlt024q/rklhZpUD5SXteLfNHEtSI7SeN0DPiFuI5g2
 RQFUxKfV14OahQ7iZryXMqRLPFtwRDjxSRPpixrP1m2EIX50QGVk9lH5IDME0FBW7ih+uV9jv
 w+K/EJYNrDBGNMSgyTpMNmKU4QDEk/dm5R6K9jI9sBGnSU63wmW3SEblAxWGK1BAHvrtxqCmZ
 H/JIJXRxfoAX7BdsGrJuNPwdARCy9xYaF7/srdhImonk2poTgwxVvF73yMU64Ovt2y1OpYXqY
 225mHCfDaXDnSmtpzMkLC4nLS1hfktwa1xr+2gTxrKXsyz3Y5TBJPIly+En2/TrpXKZGTnE1s
 nD0XU/GERdO2pBVxz
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 01 Apr 2020 10:55:21 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 01 Apr 2020 10:55:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] linux: special logic in repetitive tests
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> Wonder harder.
>
> If something is (& 3) it is also either (& 2 || & 1)
> so why have both below the first test?

Would you occasionally prefer to use enumeration values together with
switch statements at such source code places?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
