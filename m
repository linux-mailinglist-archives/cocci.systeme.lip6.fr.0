Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3C1D6094
	for <lists+cocci@lfdr.de>; Sat, 16 May 2020 13:43:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04GBgSHx011434;
	Sat, 16 May 2020 13:42:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1AC4B782B;
	Sat, 16 May 2020 13:42:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B06343DC8
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 13:42:25 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04GBgOVi002038
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 13:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1589629342;
 bh=9J1VbnNT3CmfDfiB2OKHVbYB3OcpYBCTZPecQD/IBfE=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=JR3gd6xxmMY9/leyWwT1IgsEvDqxRYm5u+lYLIivq32a51Gn3nr5ph3eKITOVpQUk
 9rE0H1P2hTbFzf/XB31e/f5om4WOauwyb9tzxMvCQfKN+bKYMBHnaEg0uuAvg1R3SJ
 Zaqu1tRzi7jsG6EOTLO7CP9FQwjuc+DieOST6R8w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.171.150]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LpwB1-1iuFWj2OgR-00fhCr; Sat, 16
 May 2020 13:42:22 +0200
To: Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <ede99d99-cc67-bf1e-0a10-b1f198b195c5@web.de>
Date: Sat, 16 May 2020 13:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Ocbz2M/+lYDJuE8ePtFpgHOgM4NdSETbHlfNq24wqatG+6WA4oQ
 hEX5eZKy+nvocQ5mT7U9+50SLP6aIU16iaB40K5BeWR9SIfQ+XQUmgOW6L1d3Mo8dhzK7TX
 qhupGqeEl/g6iTzHhHRJ63QAVAF8G0XzD5oA5tIsTnYbDl1uLpTICSkMVJ17+Ho+zY1XD6e
 yH54x4W2OuHfLiLTY9qVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CsXg9eApg+U=:hOaM20clH4nzdjgkvoczML
 9/7271TsEef1UQl9l0q/cVMAS9GbBkxTorJ5POEpgfHSqgn/sEQtD243KIVLye9ZEpEC2M2mu
 sUw4OCn2n84bIMgy2bdRFjy889RRq3ILdwLlI3qbaZLZHLoU8lfa/9cODIOqo6sov/ZcvGtau
 XwFMoWmRURTPoobL1uf/Y/cwA9MBl9Hh/oP/yEDMPmBHGZ3Y5Wk8iE6SbP1521rCuQ5mhAG95
 Gi0UVrEuZTRKsIeRIyRcg/pgO35ud5MrS7+D4Yx+n+60l5nAYFrSjzOWpHfHX0oZsJa5/rfiI
 cQDyJ8zgBzKnJb2WhXcC2XgHaLHM5eYGgBz3s8ZN5ADiffZV8OpztBULpX346NUZk23jl4OLp
 /DrMPh9zYzGVEFI2PRwypWMQ/wPznAEU3239q52XxC8eP92LdDXOD+SUOtBZnsUL7zoIYzYyh
 fUpgixZJJJZ0B0yM5RN9hYbuCvP3xHFNAzbxvqedAurXTF5zbOPxUnEjQwXqz+knDLo2jCgKK
 Z83Y5TL6YPCIK5Su1vMhEOuM3WKhJe/EntOSpaH8+IQe9TyngHGhdFcSCr6IXOvuNtZSjSVtu
 mCPnB+D0kSk9P5sXYoE/b8UabSetnF/uJ+4rzs2NV4vdmEYsszZRtrdGJiz0gD5ba1xddU7jY
 Qfp2sopRiNWacN0U3p7L4MwO9E+7+ol1SRRzSyQaUPk/iR7hd3TGKI9FtsPI7+j9r0gG30v9p
 zpO9UHVrv9QW2BYtW3lDT+koxFeUL1UK7bIw+rtYVRNS5KCCH5XCSYHMHobiqFXno2XWKsLxt
 /Yu3vapwPXOfMmhcwFm0QXVj5645wjzzhk0+HgJFiST0HeJgG/CzsfZk4LkJvdr2MBWSgkoR0
 MmhuWHCLBmxeVPAS/kZIBkTzbpecni9YrTA/3OjN4yNW2F2uUHwtcHkCyCwHR/iYX/izl11CE
 aZv/sVM9m4sGLS7q+pvoQeN4dkSFVUtnnNOOFGeUXuDR8yYomuuVfSkdf+5f+w9JUdyNim2Z6
 WtjZae5RBfRAJYdRSsiI5EJKYEFwTAG6VToqGoePj67hVCRR6A8wEcL6+l8nXI9iwDIVfWY8z
 WAgy3DV4PkrBWFvBVosZ4bHiCB6iuHteh/WXRhk/P6bteTD6auGr9XpkY8IjAKsrC9IgT8B1C
 QJ6nQN7Z1yyUlbtfWe6nMWaZ3NyXWTqp25MDMhAMOrCu5145Fk15ekOr6n7Mdrm3LOKuTzlUR
 Uv+1YKhj0pNTSB1MV
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 16 May 2020 13:42:29 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 16 May 2020 13:42:24 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Chuhong Yuan <hslester96@gmail.com>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to match function calls in macros?
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

> Normally, Coccinelle will match code inside of macro definitions,
> but only if it is able to parse the macro definition,

This is good to know.


> and the ability to parse macro definitions is somewhat limited.

How are the chances to reduce any software limitations in this area?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
