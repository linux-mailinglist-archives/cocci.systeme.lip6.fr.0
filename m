Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4DEE15B
	for <lists+cocci@lfdr.de>; Mon,  4 Nov 2019 14:36:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA4DYve9000573;
	Mon, 4 Nov 2019 14:34:57 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B762977CE;
	Mon,  4 Nov 2019 14:34:57 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B5729454C
 for <cocci@systeme.lip6.fr>; Mon,  4 Nov 2019 14:34:55 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA4DYrW1009038
 for <cocci@systeme.lip6.fr>; Mon, 4 Nov 2019 14:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572874492;
 bh=QXfOvaLsuYXhXg/365uhkH+eyRVI/S53MOxOY7iSL5c=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=K5/l2egnfCoKaUxn/cJWZE2PXEQsH2mUpMOTmw00ZjU2ffAf+/d3ml8m+lAPIW+Ye
 lAEBlYgRb2HEK3F258qv9UJIh4UUGYoXLVUCe93AvenfuvB81e65bi+bx9Bkpw9Qfs
 Qwo31ctJFcycb7lWHwPReajhhs6cnv9bVmzTYOa8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.71.222]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLFd-1iYVK12sYL-006vwf; Mon, 04
 Nov 2019 14:34:52 +0100
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1ee2e380-5e38-e2fe-7e4a-ba2ce01f72eb@web.de>
Date: Mon, 4 Nov 2019 14:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:7tA9QsFIk0ONuDCyPgsoYGjvs2/XUiyqwYXz+O6UegYrCt8apkb
 ZWCtOQBhAsI7pUjHQ1mAEXI1/Rmtq7G0ZA7zNI6CUPI23kqtYYcv8Bsk3y/D4KXrjXpwQD9
 +SAFZRk093X83TwkwV6MxVBXnx4KZtPCrLj+m9Xr2MvNMRDHSvCr0UpRbZt628Nf14+vPcn
 zW/LAhd5OUVPB8hPn5ayQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMHDAARb9Ds=:YjNc2n1P1VP47Q/hDHBEzB
 hFC7Vi/6Ggutagzk95JIg9tPaKnNaoQ5N6GSc6cs+X396nzdjH3x6i6N+In5X7mzPt5NBKS76
 tl/IyhzKWcXW6NYbWmiHUxwOZGnQySm24CSOJqq4pG/1hAYGlYs7POS+g2TZz9aDVfkEQzmFY
 YXBp5EZneO6Nlk2uE9dT61zunge9ODqsnDRW2qgEUqNU01ffQqFHNyZ3iCRdMroTWK6wifsfn
 W5iTelI1pzvdAOMBQVIJj/UhcjXfgRQszfwZwTBUIpNVymMxLIeb+NB7Z1EUljpWg8WcAORfk
 sVW9iBieIzj7kuyoxrrsHlzeWe8FjWQD0Rh8D8UCZJ0AORNmRLSmrO+ePPOtRcSl5R94A7ZfA
 mmPuWNroph7SjXkRolPIo1l7gTaqyWRmF71J2SuhWe24qmmCnKr0Z4fF4MW5np4dwafSwjuG8
 nr1Ph1nkpJHoJCaPYP/zmGd64ZsznhdpDnp/3xts+Rdx7TzLikRLgOmiW/CETm323gB0d0JIe
 T525o2p/eOp/x10oJlXI9HUO4lAuRAmZaNjFBdgu7As+FwazNeRhtXpv13HuDgYC1PhrGoA0r
 bsVcSPmGeFATygf0cCC0wH8TJibCKTg2Bf+2T1SKfsgGD6/ly+nHQ9kPrtnS2lGcf61AtVxET
 yqmendzoMhWUE0yuna8qwx3c1hmWxBMW1BGtUfEiDNNFUrFsWq4kDEXQK3lP+9rwnOFHABMT5
 pShnAz4OVr0p9nqfbw/iL89fdVFu1AkPXA9xmYCo20FJ5YmZ3MqHcP48zP9F5MkKJaSIswDq+
 ZftglF0rfl34nDBN6NzxtK/QNoeN10eQHs6p3Q440N6V9HwoK7RYeHYYNTr2OdOlO4CqJVO/j
 DSEaCsHM4mI9uZ/LlrX4e/LUnmzvqlyx124MjLhRu9XQdS0ceLg9cDRsgHsZPxn174aMvbLiF
 gpy38eMwBrp79F20iZuRd1t9QDfBVM3bx9Ndv9jBedoEj8bwg+R1yFp78t7BBqVzQ7K4vVizZ
 YWm+W4rzN/DFJgpFVIMGEirZVbT2iiiQWwaVCtaPIr3/ksa+DQ8t2JuvscRwTvU0KLmNIxaTs
 qq/2hDDb188jhs2TXIZcEaZUYqN1UKYlP+mbciv2sDrN8cVQFra7fq66GOduqXajXTLldryDz
 RYAhGZFvc7H8We9TLbxJL4Q37MjD393jhAsyGn/8bQN1wW6luJ4cy9ZUoi1KCFd0dRscr9gVr
 qVBLZC9mXkhmy9rv8D0YW/oHg0agmIjwLQBqKyE+qSlsebLnZPaQW7JVIInc=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 04 Nov 2019 14:35:02 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 04 Nov 2019 14:34:54 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Coccinelle: zalloc-simple: Checking data processing for a
 bigger SmPL disjunction
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

Hello,

I have tried the following small script variant out for
the semantic patch language.

@adjustment@
type T, T2;
expression x,E1,E2,E3,E4;
statement S;
@@
(
- x = kmalloc(E1,E2);
+ x = kzalloc(E1,E2);
|
 x = (T)dma_alloc_coherent(E2,E1,E3,E4);
)
  if ((x==NULL) || ...) S
- memset((T2)x,0,E1);


It can generate an usable diff hunk.

elfring@Sonne:~/Projekte/Linux/next-patched> spatch scripts/coccinelle/api/alloc/zalloc-simple-x.cocci drivers/scsi/pmcraid.c


But I would like to add the last case distinction also to a similar
disjunction in the known (and discussed) SmPL script version.
I observe that the expected diff hunk is not provided then.
How would you like to fix this software situation?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
