Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 178092963F
	for <lists+cocci@lfdr.de>; Fri, 24 May 2019 12:44:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4OAiEC1022624;
	Fri, 24 May 2019 12:44:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A13B0775D;
	Fri, 24 May 2019 12:44:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 27E497747
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 12:44:12 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4OAiBtd022193;
 Fri, 24 May 2019 12:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1558694650;
 bh=T0JrbnlZMv2cecabZP97MeCtR0FFFlpI9UZZ/lhn7sM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=gJr9c+3Y3YanBNGxWRv7KyjpuBfykr9XFMNR+5tLi3Bf3h197MWOyZed52nSlmj0L
 wsBeI02M+vLuHssQtIVWQ+B+GqNSm0f0u6wWHHABFMRRcQ4Nidz0twYQsn9YWeKPJi
 wO9wsNSRIrgg7XZLt+E+356wRalD2micYy21vwCY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([78.48.148.166]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MHp7t-1hUwcx1j9p-003hru; Fri, 24
 May 2019 12:44:10 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
 <81b409c6-5986-5961-5edf-843c6737d88c@web.de>
 <alpine.DEB.2.20.1905231500230.3573@hadrien>
 <3a79c8f5-9483-397a-eb98-adeb40634fe8@web.de>
 <alpine.DEB.2.20.1905231659010.3573@hadrien>
 <215d5cf7-b44c-8924-d049-e2a6e579f138@web.de>
 <alpine.DEB.2.21.1905240821260.2689@hadrien>
 <8452712a-c9fb-bcc5-4add-f95e922635ef@web.de>
 <alpine.DEB.2.20.1905241154320.3669@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e286b216-362b-5990-c756-ea8ae10ce63e@web.de>
Date: Fri, 24 May 2019 12:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1905241154320.3669@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:u/LCfUkHB2koSiribzICZKtIrosyBhnJqgvUDVI49LLk/HVJMNJ
 CQjqeFbAC9PGr5qfJiQeUOUd7egTmRwbgVUrGFH42yKLvgZxR0BqI+YP9Vkh3PpVvq0Y+sJ
 MfkCoA5oxkLB1Ooprg2COmKTdFuQZBFAzdAF8OkBBXlC3ouUnCBDZ0TRuUyGvDnblACGCgm
 fsgMmVEJRSJdN2dIKCDxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R2x+wwYGEpw=:0l3mQs8hSLUZy4p0TOQnZm
 l/W8odXJQcU3x84bINZDy4JrIr00G4U3NWokWzVacQrR2Q2jbyTOi6Nz7iQCuu73LvQyHhCOZ
 0pOAmu722AMtnNcW/lxA4J96y+xDNGscHHyAxBxEFopLZhNxddyBXjV1B6Y1xV63N6tWj+2PH
 jDZkC5GRuJ4aKko0wV9Y+lQ+PLzQk53WFOB3C6LrRBslnPDdHEqoktxq0T5vfph+eBBHcsvwR
 dAH+0tol6gsZJ3TSlhmhGcwTo9i1Z79pNtFvPd8kZ666ZIHs7Yt0zZdihlxnX9p2hb6897ADp
 up047/M+9HrSWWbb1RYmTnkeegYq5x5Ois/Put+RS6/YIChjRSr8xcBXCkiv98Xzj7DuNGDI2
 z4LzmZf9ebkqdk7iS1Z+2BU9k+kEnEeuUugVx4sGpt/VaISX+piAVySvzuFgW0YFJFPiNnZsR
 8KmP2VObB8r3GKQI003LOFz86iAGtQGvgUupYQ56h4kvYLZLC1ZsCMDipSCh2Dd20NzssqxSG
 lt5jg51xllnaRGvBH89gsFQsgZmRDyR/4Bv6F/XitdjtaJZp2xW6fW/Bij7GPuJbUYVlPWkB+
 1D+wI4NpuOxU1N7tIRa/ndOSqEnJQdLDoC0E3Y/FZ7x1yWbIIdxPycsupxGu61UsMV6lAPhSF
 LAGgGhrXfUCP3Z3o78rTeT5PQHQLiwVEL6w9Ni3V0pG+BYLLfJ7+ELOdRANQuJQpD2EEUFC89
 tLr3ZyG2mfPMhk77ngagetEg02YfypYhR0VkUP34L+eLh03fAt6mdtug54yI9dJoSLWrKkPoV
 BjwG1Bt6j81yz5+bHC+Cfzt8z1sTBY0Qnu0eWVeURy1OoMHeQWa8krBX0oJMUWQeY7wv3CXfR
 pD0qqmAe//Pb4jz3cO0flX5HCW+qMnJ4FUx3cV27GdY2SsXqdm9dfjS7qDzGoJiEIZMy1DjgS
 9VyFCYO2VgFxRFB/jpyu05RDM3JZSLf7UmmPMJCLc8sA0HjagVfa/
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 12:44:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 12:44:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Checking configuration challenges around OCaml usage
	for SmPL
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

Pj4+PiBvY2FtbGMub3B0IC1jIC90bXAvb2NhbWxfY29jY2lfYmJjMzhkLmNtbyAtZyAtSSAvaG9t
ZS9lbGZyaW5nL1Byb2pla3RlL0NvY2NpbmVsbGUvMjAxNjAyMDUvb2NhbWwgIC1JIC91c3IvbGli
NjQvb2NhbWwgL3RtcC9vY2FtbF9jb2NjaV9iYmMzOGQubWwKPj4KPj4gRG8geW91IGtub3cgd2hl
cmUgdGhlIGluY2x1ZGUgcGFyYW1ldGVycyBhcmUgZGV0ZXJtaW5lZCBmb3Igc3VjaCBhIGNhbGwK
Pj4gb2YgdGhlIE9DYW1sIGNvbXBpbGVyIGluIHlvdXIgc291cmNlIGNvZGU/Cj4KPiBJIGhhZCBu
byB0cm91YmxlIGNvbXBpbGluZyB3aXRoIG9jYW1sIDQuMDcuMQoKSXMgeW91ciBzeXN0ZW0gY29t
cGlsZXIgdmVyc2lvbiBhY2NpZGVudGFsbHkgdGhlIHNhbWUgaW4gY29tcGFyaXNvbiB0bwp0aGUg
bWVudGlvbmVkIE9QQU0gY29tbWFuZCBleGFtcGxlPwoKU2hvdWxkIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgZnVuY3Rpb24g4oCcZGVwX2ZsYWfigJ0gYmUgaW1wcm92ZWQKc28gdGhhdCB0aGUg
dmFyaWFibGUg4oCcaW5j4oCdIGluIHRoZSBmdW5jdGlvbiDigJxsb2FkX2ZpbGXigJ0gZm9yCm15
IHN5c3RlbSBjb25maWd1cmF0aW9uPwpodHRwczovL2dpdGh1Yi5jb20vY29jY2luZWxsZS9jb2Nj
aW5lbGxlL2Jsb2IvYjVjODg0MTg3MmRkZDA0ODE1ZTk0OTk4NjNjOGY5ZTZmZGE1NmZhYi9vY2Ft
bC95ZXNfcHJlcGFyZV9vY2FtbGNvY2NpLm1sI0w1MzMKCldpbGwgYW55IG1vcmUgc29mdHdhcmUg
ZXZvbHV0aW9uIGJlIGJldHRlciB0YWtlbiBpbnRvIGFjY291bnQKYXJvdW5kIHRoZSB1c2FnZSBv
ZiB0aGUgcHJvZ3JhbSDigJxvY2FtbGRlcOKAnT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpDb2NjaSBtYWlsaW5nIGxpc3QK
Q29jY2lAc3lzdGVtZS5saXA2LmZyCmh0dHBzOi8vc3lzdGVtZS5saXA2LmZyL21haWxtYW4vbGlz
dGluZm8vY29jY2kK
