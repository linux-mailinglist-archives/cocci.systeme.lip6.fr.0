Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5AE597D
	for <lists+cocci@lfdr.de>; Sat, 26 Oct 2019 11:46:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9Q9kEO0014802;
	Sat, 26 Oct 2019 11:46:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9D9D377CE;
	Sat, 26 Oct 2019 11:46:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9638A77B4
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 11:46:12 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9Q9kCoT018972
 for <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572083171;
 bh=p1nt12Y52yDYQVcen1bvwIv/h7Bm2IWqJjYMssfyAPA=;
 h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
 b=mfv1Xy0T4kH5ih/ycexpatmOQFwbhv4lgbQS/5boxhIFxunt/KhIp9uZ82YUO3rQI
 8QKyQXrgd6Ewxc53gOTXXIq05pSbdIg9ZQSlP7hKiKqieksaOAqGJSChtSpg/835XL
 Nuc5RfNmgJYqPbZh52+VIbFsev4pBS7UEiE8TXDM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.128.16]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MbQOe-1ierYt2emK-00IjjU for
 <cocci@systeme.lip6.fr>; Sat, 26 Oct 2019 11:46:11 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Coccinelle <cocci@systeme.lip6.fr>
References: <384c6657-5ddc-ff47-14e2-2ffad31295d2@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d7b9c6d8-8b67-2a05-188b-0b1b6b7ebc2a@web.de>
Date: Sat, 26 Oct 2019 11:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <384c6657-5ddc-ff47-14e2-2ffad31295d2@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:a3I3D1w/hM8ILlSrnnlPF5F96ZiWxEtumkEVmuS+TKs8HRrfQ97
 sfgv55NcW1+9d23hMxyox8BnCvUN9BLBIWOh4dZ4EnRSFDriWvVsJs2Koun0X6ykaImrr1I
 o2vE98D42LWGCd/OhYfKiOhTZ+MOjEMMb/JSo0krJbOLzHfFcGPIHX+WndARtVrpMxDHscJ
 Ox5eiQoMynZieH1hHM+pQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1j8IOABd4sk=:MYIEXgWBC3fLiuBiaSOA0E
 mPgMx3QdaaRqXqihvpTgnBdomKaaR0K4NTD2F1GiC3SfGwscV2ElzswSA7qXG6NBdcV++TtJy
 LEtxDHEWrTew7M0nz5ZB3TCwB5Q8+I91WVRePkRKb2BDkavTcWamFq/5cfHpPqiqoKolkHz4N
 y2kfeTIWiMMBivU/ce3gW9pFOpKXYZbG5dNgy7cWPZ90EHIdRWSXr2aPeIGy6s2VfqFCDxytc
 i5lo+mqRBDwOsBw//uTxYw3/zHdil9qEacwlu0+nwsAZIstyzMjIAOu5NVgnj/bA7UAr+I/1M
 B3Z0G/NqcWmdj5468uCWBOa1ZIUw07+2/g4BCGKK6fRopH2rdYJ20u6Vr9wCuIAzkm3waYWno
 hGrj6Ow/MY2iiWoPBHY/R2V7FVCO2yVYKbP28kzBw/JVIcFVrN/sdFX4vKMlsxaMvBNr7zIxV
 JXeqqU+h6+pNrUuUSw1vdTzt8YhFdGSoaIhFL7CA0gmQYS/bm/k9b3hP3tfllAILCqyVbd81K
 AQkGjAHljlrQBq800TVUClP15dP36NcEjcyK+IRuEz5Ao1V3wuK2lHSTfGgvl3Ier5UXB+fFw
 +6HdaH1v2vvjLPLHIJYxbIVbcqIBAxuiCsbue+kfC+MaatQW7rn6IT+0zN31IMq+Ibag4bKBE
 KvuVLkr1uObUwbLF6vTHhghJ9VN9GNnywaVxV7hCanpv8+yadfrNV4+UVQqnHEBaorL5urhEq
 MxSTpI/ZrO7bHHBz2Wk98w95bqPL5Y9SJAmXaAeEWjtDqxvryfljxdblag4eCO2t6rHUqe7H9
 QPCyJBpruBtpUJt6ZMMHpl1UF0t52dM5XFfF6VXrKT0dDZCcAMy1+mY6w6rcSGhcWtizJtWsc
 MS8C7khYHC/GWkqp57Zj4UoGZ4C6BjU/z8QH2uy2RXqCWLRt6aDIw5U1XWtB5/BLDqWXFfnHH
 fI6+4M464dNXsZB9cQ5LDq8Eqq8wfDeY4x5cmZ7SwGxuLQ1hLhbjeW5X4xc/hG4TC28Ev9A8L
 oyipJRvqnGB2S3miM+kd9FlcEeayS/zNiQJGAjxccp8zRHDhI/Crwt9qGWMbIozIO7GtWe8oL
 9cwWnwMjT7FaY8DtNu9J/f7mRRFZK/xKDosrU0YK7Sl6pyBpXAsqZztXGO/GHS8KUfVvSAyN+
 Tv8HkhjKS52/cKBNb/12MSQaEpZ39N+wLzgnuo0asS5hfY1iHP8jiaLfHDFJ7TLDJW5UvOkuY
 Z/Sc8gevCRn8t1ERVt5bOpNk/MzmeqW3YpH63KzhkckzT4bndqhDZLdd0pc8=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 26 Oct 2019 11:46:16 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 26 Oct 2019 11:46:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: Re: [Cocci] Checking placement of spaces for code changes with SmPL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

PiBCdXQgSSBmaW5kIHRoZSBzb3VyY2UgY29kZSBmb3JtYXR0aW5nIG9jY2FzaW9uYWxseSBxdWVz
dGlvbmFibGUKPiBhY2NvcmRpbmcgdG8gdGhlIExpbnV4IGNvZGluZyBzdHlsZS4KCmVsZnJpbmdA
U29ubmU6fi9Qcm9qZWt0ZS9Db2NjaW5lbGxlL1Byb2JlPiBzcGF0Y2ggLi4vamFuaXRvci91c2Vf
YXJyYXlfc2l6ZV9mb3Jfa21lbWR1cDIuY29jY2kgdGFza190ZXN0Ni5jCuKApgpAQCAtMSw2ICsx
LDYgQEAKIHZvaWQqIG15X3Rhc2sodm9pZCkKIHsKIHZvaWQqIGNvcHk7Ci1jb3B5ID0ga21lbWR1
cChvaHMsIHNpemVvZihzdHJ1Y3Qgb21hcF9od21vZCAqKSAqIG9oX2NudCwgR0ZQX0tFUk5FTCk7
Citjb3B5ID0ga21lbWR1cChvaHMsYXJyYXlfc2l6ZSggc2l6ZW9mKCpvaHMpLCBvaF9jbnQpLCBH
RlBfS0VSTkVMKTsKIHJldHVybiBjb3B5OwogfQoKCkhvdyB3b3VsZCB5b3UgbGlrZSB0byBjbGFy
aWZ5IHByZXR0eS1wcmludGluZyBjb25jZXJucz8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QK
Q29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlz
dGluZm8vY29jY2kK
