Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9671E9D7E
	for <lists+cocci@lfdr.de>; Mon,  1 Jun 2020 07:48:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0515mDtM008643;
	Mon, 1 Jun 2020 07:48:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 209E77828;
	Mon,  1 Jun 2020 07:48:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 909885D47
 for <cocci@systeme.lip6.fr>; Mon,  1 Jun 2020 07:48:11 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0515m9ai026576
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 1 Jun 2020 07:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590990482;
 bh=3NfdEOcEuVpzHL9fLwQi+w0me4LqMXjJFSJdC/uf5L8=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=P8xRdqxh7FvbjIqH42zo0uh9RUAyxSKyEWdW+qB9YcXiVLayEkeXX6lYeAJUxo3Ix
 IHwWu9A9H7+iUO28kcQlqC9e2a3jtV486zB4QElI/R+t7lejocYzB+NzQaDcW1Ehbv
 XcpdBVWUfTtqi6leL94kDoNDdE3OgNJjlTFXEfwU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.133.32]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MYw31-1jTLNp0J8t-00VgDQ; Mon, 01
 Jun 2020 07:48:02 +0200
From: Markus Elfring <Markus.Elfring@web.de>
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix
 <nicolas.palix@imag.fr>,
        Coccinelle <cocci@systeme.lip6.fr>
References: <02c75f13-ec79-f4c0-f28a-8a354ea1f6f0@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6cd81cb9-7fb6-bddc-65df-c3d50677ae7d@web.de>
Date: Mon, 1 Jun 2020 07:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <02c75f13-ec79-f4c0-f28a-8a354ea1f6f0@web.de>
Content-Language: en-GB
X-Provags-ID: V03:K1:IqoQ5dImrO129UCFy2lJjRF+bn2zNZpg52mE0au73MyJnd+8WNb
 nQYKpxbfZXHbE9NMzWf6G5xZ3YM5cpZvwL8USfURxSHvMOk1OYeYPPdY2nMKI8mrxRRMurX
 7n7ALMbGcm2oA5jfoaMJ6tXT4AAbD4NgNFpbeahbEml5dXcdiEFxffz+xJpUDDBwm0coEve
 9bWrcjobqSA2hzRw5Xp9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MEQ4ZoR97/E=:89/TNEFVVwGZjvN9ZHHTDG
 7pl2dFFVfDgQhkZWyGwCYghDyGUd7iF6bv8AIjUlnu2WXXZ8AC4/XJZR2iFhB3FW/YJo8Xzj3
 mwoNNL3/ZDo1GuavFEhtVRBwIfsocDxDXZrAsUobfoJXDygL7lPYMcqWZk09J4opKPzboz3oD
 /sJ3pkYiCm8WVhL8xamOwbyOcV/JIvlyj8orLL0elAMTHhFTGzIttQbjA5WtzX9/+LDX4JZ3z
 xUpxjNMdQ4siLPqyW8my4Ig6kxaHESS6/y0GpezzF++W4oN/+ODXGiRnHceZuze5NXmBRx3K4
 yDI5Qcd0PXdOJVKrQsZpHnyHc9Nvr9DWhw9Q9aPIU9mcUbGa3Y5jSDvYx+cE+o849CLku0eyU
 Vrxd9jtSlIrcopofICaq2uPnogO5yzBlhwoiKcYD2Ys8M9t9/PON6YWpU/bq3a7EEREr30QZy
 ETwrsbNQRulhOsTtjkuOf+EgC5nsHwsq9DyicT3Y9h4ibGKbUng9ypJEVHZbdoDKCvj1tMH/X
 +zoQrJB84oeR6pnnDeHt2/mj7tmj2NB7Ku8BwJf9eLS1631djYnVgJsSgPfoCxfk+rgKkMiY1
 7r14y4ekWJdQuY2yN7B3CE8aIKvyDF0jmtAy/wc7cDet6E3HOC5/AbiRBKO+L2EjYiJG8TvwA
 Y5XeNEJ62PEpD5nG0TnyG1q6zmOU+xPwKeV3ngTDsVyTNG/TyVPo5/09GxRgvkWXBCdNS+MmA
 zh30G+r6gWTbY/6ikE2f4n9MV+SDDotkG9pupf3o7/O6EtF5W3FVNsU9oEoUiuPtg/+Tl4DLJ
 BUIIMm1JjZZvKLXYAiRt8HIeLy+XJTjb1QXE0uKPWmfAqDeva3tcmoqGIWBmgKP5rGa5E21pw
 zys9GOeSTKVD6jcEUznxSeo8dDnKkxyhK/pGwfccgshE/olUWHf3vMy30leur8n6lPHvZZ/DQ
 3ebN8Xu1uBn5M3r+X08vATTUICmPLrCGoLe7DCWmYd6j2nK8HCbtlaDTNRac6rk7kw58eH8qL
 U7osNA3MHLEsdPw/yhyh8bo99RrLF/bB7YrayctLlDunag0m9INfj+BHUUcBpah2Q7Dp4yd/S
 QjtXshxVp3xl/jj5TYlNKk3JrdxrjBkP1BEy6Bb6R58Y4ux7rlULgbX/a0Zz/shvZ4ut6Vy7g
 jXb4x0qv2Y6BRV4jJ4halGA5pH7UMh/Q+rbS3Zub9mJt9tbtkRhfWN40m5dV39D3t8abtcHDa
 AEwK6VRcfFGjlJiuf
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 01 Jun 2020 07:48:16 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 01 Jun 2020 07:48:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [2/2] Coccinelle: memdup_user: Extending data
 processing for special tokens
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

PiBVbmZvcnR1bmF0ZWx5LCB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZSBkb2VzIG5vdCBsaWtlIHRo
ZSBmb2xsb3dpbmcKPiBTbVBMIGNvZGUgdmFyaWFudCBzbyBmYXIuCj4KPiAgdG8gPQo+ICgKPiAt
ICAgICBcKCBrbWFsbG9jIFx8IGt6YWxsb2MgXCkKPiArICAgICBtZW1kdXBfdXNlcgo+IHwKPiAt
ICAgICBcKCBrdm1hbGxvYyBcfCBrdnphbGxvYyBcKQo+ICsgICAgIHZtZW1kdXBfdXNlcgo+ICkK
PiAgICAgICAgICAgICAgICAgICgKPiAtICAgICAgICAgICAgICAgICBzaXplLCBcKCBHRlBfS0VS
TkVMIFx8IEdGUF9VU0VSIFwpCj4gKyAgICAgICAgICAgICAgICAgZnJvbSwgc2l6ZQo+ICAgICAg
ICAgICAgICAgICAgKTsKPgo+Cj4gTWVzc2FnZToKPiAyNTogbm8gYXZhaWxhYmxlIHRva2VuIHRv
IGF0dGFjaCB0bwoKSSBoYXZlIGFkanVzdGVkIGEgYml0IG9mIE9DYW1sIHNvdXJjZSBjb2RlLgpU
aHVzIEkgY291bGQgc2VlIHdoZXJlIHN1Y2ggaW5mb3JtYXRpb24gd2FzIHByb3ZpZGVkLgpodHRw
czovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9jb2NjaW5lbGxlL2Jsb2IvN2NmMmMyM2U2NDA2NmQ1
MjQ5YTY0YTMxNmNjNTM0NzgzMWY3YTYzZi9wYXJzaW5nX2NvY2NpL2luc2VydF9wbHVzLm1sI0wx
MDQxCgrigKYKICB8ICgoKGluZm9wLGNvdW50LHBjb2RlKSBhcyBwKSA6OiBwcykgYXMgYWxsIC0+
CiAgICAgICgqIOKApgoJIG1vZGlmaWNhdGlvbnMuICBmb3IgdGhlIG1vbWVudCwgd2UgdGh1cyBn
aXZlIGFuIGVycm9yLCBhc2tpbmcgdGhlCgkgdXNlciB0byByZXdyaXRlIHRoZSBzZW1hbnRpYyBw
YXRjaC4gKikKICAgICAgaWYgZ3JlYXRlcl90aGFuX2VuZCBpbmZvcCBpbmZvbTEgfHwgaXNfbWlu
dXMgbTEgfHwgIWVtcHR5X2lzb3MK4oCmCgoKV2lsbCB0aGUgcmVmZXJlbmNlZCBjb21tZW50IGdl
dCBhbnkgbW9yZSBzb2Z0d2FyZSBkZXZlbG9wbWVudCBhdHRlbnRpb24/CgpSZWdhcmRzLApNYXJr
dXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kg
bWFpbGluZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5m
ci9tYWlsbWFuL2xpc3RpbmZvL2NvY2NpCg==
