Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74507E9CFB
	for <lists+cocci@lfdr.de>; Wed, 30 Oct 2019 15:02:01 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9UE1YWG002932;
	Wed, 30 Oct 2019 15:01:34 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4437177BE;
	Wed, 30 Oct 2019 15:01:34 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0FC9174CD
 for <cocci@systeme.lip6.fr>; Wed, 30 Oct 2019 15:01:33 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9UE1V6p002155;
 Wed, 30 Oct 2019 15:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572444059;
 bh=JkWqlJ6BZnr74fPD8K+GElPXF8H8wiebGjHwwhPampc=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=C7yP4reS+8pWItrvp7P5FKlm0BbYYvDAYBPTz0ZlFTaqzuE8Yg4JdMrkHTJTs/lqe
 fhgpcNJ+4eHzsKNlnMBBQNBtEzmJNLMTzs+JbevOJVncMaZtJOzQ62SBRg6F4+My8D
 yo4MFVAyYvkYx4piDOToXcZp5DpLTOA0CXCShM+w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.104.79]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKJ7S-1iRSQO3qx4-001h7w; Wed, 30
 Oct 2019 15:00:59 +0100
References: <1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn>
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d86976ac-f12b-ba0a-fc96-57ece8741db5@web.de>
Date: Wed, 30 Oct 2019 15:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn>
Content-Language: en-US
X-Provags-ID: V03:K1:6xHfQw59iKyWvD5r38pMqQPaEm29Ml5Gzg19EBFSfr1mP+q4P78
 LAYof/YuqMJfgdqD0QAO93E4UFf6Gg3aHYLcOPi5Rf79GdyecyX1+Ma7bIdGjL02CR4fxY/
 77lQBJdFpOoguyG+L33jJAFHsXchkq5nCTSHvnqSBFdc6PqBkk/zDAoM3M++uyrVuY/cP7B
 ir3MmN5cSlMTq9rk79j6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qLIsi8X7iL4=:OQ1v/tyDCy9l1FhTbxBqpG
 daEEo6HACP2sk7PKLNRNuoSrOansO6C8vi5Lv9paAZVfNCS3ppAlvaHILoAQGW2KUPasYruzl
 bpp/uwYVONHeXS/7QIvqGD6o1eTsASNTm6HctcPs6j9CstIy65/hZe6NZKgzBG26rKQslLNcE
 o585vL0gGGFGHi+MrQfnwFWhQ9c6D7cOqC1Iz1IwS3uWaOtkSbsbjLlzj1jgSlgXRuvXzvzr5
 wnth7CdLPLQJ5E2zwonzpKMPAgmR69YT3e6noicH8wsp1NUFSaZ6tYoN50dJ8qaBUU4qAm8y6
 9TcBw1mjbuy2H/du7sJIrmHO8hM62/NPun+qEvbCmJlfkugNtONzT7jfTNFnxdUVvbGD6g1eT
 58u6sazRpWko2N0kfYtRWDv4n/NKq5Od2Hxyc1EzmHCTYW4cX+3q6Zmp2Ludx4tXLEogon80S
 CSccjvrf5Gt0jdD4J2m/tLd3JOj2X954G/l4Ah1wryD6BZ1QYH5wnBzIw5FsMFcgjFfiaqPYM
 bc/v7d/3l+GJm1RNS9yoKT7G1foNnB99ANugcsAQ989a3yD6B1VK9dAbcsvPdrQBar44uDPub
 z7MHhM5Ky4eZCbG/P/cK/L9mVG/EYOarxb30njsGu9h6ukD+cBWIxyd92v+QqlcVP9qyjXOcc
 oCCfPgmHfDszPzMM10mkZrYisEbQMvyvJr+Cc85R864WWglyphXibIKdJVwU6MzdTYZo2x2sG
 69RRFf3wYt4+WlgtlwA764/UvmMfiQTu/LQh5u6Zzs24v61NgoRtJi/w7bH8hNxG3sY+2beZm
 twpCX4uM0Co4uSdG0clfPsjMlmkf6HH58k0ZP+5suFchy5BIc56n8jLJW9CQ/P+spvIqBaFTJ
 CRsSLK6JjOAfysZAyalH+uaOLYm6uwxP+4PvOEQzYMJ5hN4vnmI9yU+PTt2EuEeCmxUjnKy3g
 F98f/dESfPDHOjVhLHDEd55rAfcD5NANfLxtp1DL/txjTEvWxqa0J07YEFfu+rm490DRlVBSA
 QCUfmE0dcNgg3vKkDm+VIcXKLuYsfv9Vc2QiUDIBXfPzks5I9h8fOID6xVAVQBLcjo7xFWWFR
 3fgb32snlNQHSMACWEik+HDyUojRyZ5dHnGdaMCvgeRo/+L7dnEbZtrMTBZnoYcZp/Vi4D913
 dwGgVff4FNHpZPso9fq3QsHhGcO8IPJ7mr8i3nUf9aDhs+eUmtiuY9Y85gVC1FcOmfLoeUVQz
 Cp/RAhg6FPTr9zut07gymvIzWss3aBvuQECm8KeB0eoFc6bq1XoDb5xzY2H0=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 30 Oct 2019 15:01:36 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 30 Oct 2019 15:01:31 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>,
        Cheng Shengyu <cheng.shengyu@zte.com.cn>
Subject: Re: [Cocci] [PATCH v5] coccicheck: Support search for SmPL scripts
 within selected directory hierarchy
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

SSBnb3QgdGhlIGltcHJlc3Npb24gdGhhdCB5b3UgYXJlIHN0cnVnZ2xpbmcgd2l0aCBkaWZmaWN1
bHRpZXMgKGZvciB1bmtub3duIHJlYXNvbnMpCmFyb3VuZCBhZGRpbmcgc3BhY2UgY2hhcmFjdGVy
cyBhdCBzb21lIHBsYWNlcy4KSG93IHdvdWxkIHlvdSBsaWtlIHRvIGltcHJvdmUgdGhpcyBzaXR1
YXRpb24/CgoKPiAqQWxsb3cgZGVmaW5pbmcgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIOKAnENP
Q0NJ4oCdIGFzIGEgZGlyZWN0b3J5IHRvIHNlYXJjaAo+IFNtUEwgc2NyaXB0cy4KPgo+ICpTdGFy
dCBhIGNvcnJlc3BvbmRpbmcgZmlsZSBkZXRlcm1pbmF0aW9uIGlmIGl0IGNvbnRhaW5zIGFuIGFj
Y2VwdGFibGUKPiBwYXRoLgoKKiBBbGxvdyBkZWZpbmluZyB0aGUgZW52aXJvbm1lbnQgdmFyaWFi
bGUg4oCcQ09DQ0nigJ0gYXMgYSBkaXJlY3RvcnkKICB0byBzZWFyY2ggU21QTCBzY3JpcHRzLgoK
KiBTdGFydCBhIGNvcnJlc3BvbmRpbmcgZmlsZSBkZXRlcm1pbmF0aW9uIGlmIGl0IGNvbnRhaW5z
CiAgYW4gYWNjZXB0YWJsZSBwYXRoLgoKCldvdWxkIHlvdSBsaWtlIHRvIHVwZGF0ZSB0aGUgcHJv
dmlkZWQgc29mdHdhcmUgZG9jdW1lbnRhdGlvbiB0b2dldGhlciB3aXRoCnRoZSBzbWFsbCBleHRl
bnNpb24gb2YgdGhpcyBiYXNoIHNjcmlwdD8KClVwZGF0ZSBjYW5kaWRhdGVzOgoqIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2NvY2NpbmVsbGUucnN0P2lkPTIzZmRiMTk4
YWU4MWY0N2E1NzQyOTZkYWI1MTY3YzVlMTM2YTAyYmEjbjE4OQoKKiBodHRwczovL2JvdHRlc3Qu
d2lraS5rZXJuZWwub3JnL2NvY2NpY2hlY2sjY29udHJvbGxpbmdfd2hpY2hfZmlsZXNfYXJlX3By
b2Nlc3NlZF9ieV9jb2NjaW5lbGxlCgoKPiAtLS0KCuKAoyBXb3VsZCB5b3UgZmluZCB0aGUgcGF0
Y2ggY2hhbmdlIGxvZyBzdWZmaWNpZW50IHdpdGhvdXQgdGhlIGluZm9ybWF0aW9uCiAg4oCcQ2hh
bmdlcyBpbuKAnT8KCuKAoyBJIGZpbmQgdGhlIHNwZWNpZmljYXRpb24g4oCcMTrigJ0gdW5uZWNl
c3NhcnkgYmVmb3JlIGEgc2luZ2xlIGRlc2NyaXB0aW9uIGl0ZW0uCgpSZWdhcmRzLApNYXJrdXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFp
bGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9t
YWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
