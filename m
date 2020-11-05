Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A886F2A8509
	for <lists+cocci@lfdr.de>; Thu,  5 Nov 2020 18:37:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0A5Hb8Pe012357;
	Thu, 5 Nov 2020 18:37:08 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 23A1E77C4;
	Thu,  5 Nov 2020 18:37:08 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A4A2E7493
 for <cocci@systeme.lip6.fr>; Thu,  5 Nov 2020 18:28:54 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0A5HSsc5018889
 for <cocci@systeme.lip6.fr>; Thu, 5 Nov 2020 18:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1604597333;
 bh=uZiZLfwr56hWNbhRX9bV31IbsleQETKs9EESRAqDfn8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=qM5RIhAbTNUX7gXQlghZZqJqncdHwuwFwJsMRjzFWbys6PB/+0fjEghAQ4Y0UQD4j
 gFzh2BGmxEVk+CiwxB7UlJaOS/62ONcTw5EoQxlPj2tCUq0GelmK2buJncnp/r/g56
 rPyY4svE/dM15UqC22ZXNImh9tK6s68BKatyYxE0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.129.92]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8hhT-1kOXX40gk7-00wCmF; Thu, 05
 Nov 2020 18:28:53 +0100
To: Julia Lawall <julia.lawall@inria.fr>
References: <7035a5fc-0a9f-09be-fb6a-c3418e98a953@web.de>
 <alpine.DEB.2.22.394.2011051648030.3219@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <77b449fb-0f1c-9253-89be-b38c28b4b835@web.de>
Date: Thu, 5 Nov 2020 18:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2011051648030.3219@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:n+sxyDKf4i+NDve4dSU5ihsnNGyli4dmMN6RxEusAmZ2lGFDOF3
 M3XvW2qmf1+soc+smIARIHWqn59kZzGHImaic28i/waXIw6kXPj+vSkvLILpBn35bGki3xi
 iGqlHCf5IKffFP2eMV7lcZNnk7h9IH0Lm03VfhW+CQ80Y6R9Yl8WFkcMxSYMnp5HV08Hulh
 w52CGzsffegS4zoNgvGLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qB+Y+5mkI2c=:2iKc16slNuJScHtGPwhcob
 AUoazzPdz8ITq0RktryECyGCoIQgoo68tpVXlad+49xCgGls3yamfJkiGhpmNvKvjCg2BIs9p
 4ij0mpson2XRSLD/H88VV24RvDmsdAfvP85fNPc+/fLpsFRWSPVsfTmGfv7We/71Zc/D9yz34
 WBt9dR1tR9tJaFGF/raB7WCe7X2PnKDIrH+dlWrik1Rd6ffdhEJdruy/meV/arkTBnUGto7Wy
 j50gvGhJZ/1QWtGJAxLu3z6gr/n6K5Q+Vurs1ycmEqH7/T8ddu24sMGU/iu9SVFoY90a96Fyh
 GEHDDOduoWjKMYFaV51Yy/BUfXU8uLVBKzKdtBi2r+nTK0fNxVUAKkE8W1OF9yB5amd2Pe6SI
 es6EXp+WojxghaS8iwX++1oKcKuYqgmqwrRmEAhENk5YIfHAKZ/ZSYQl2D5PIoRRrpqr1/Lpr
 7T1l5AutAWqt9MAvmNRot+D5i2Rl1MPRU4AHyg+E9QrXnIlbTOyqdRD60iN0Rqu0I09GhmTrL
 qpc4gX0x7pufjYFYc/vNQmKgaZoqVuGt/UYqiQV3Hj9YKh/edt9UZI9j+4beWD+wwJnqOnMVg
 kZJgSfBQWNZSuKklS4fB+oAMi7s5+EvRsNCjcy+UF7cAF+B0nyRinwo4MVvG6v4MdTLw1/EHF
 0wAkSDtEhzCLefNbrSTeiEhdcO60QzK7aNTCUTUnaM3K8t8MoSVy/06Ly0U6Tlg19bRDklL/J
 Edrr5JmrRvq3It0JyhDmDostz/3CtSE2498iMp0T1LQNqRyYH2HFUR6lN9xz+5FFcNRDSeUt2
 PJnEGxzYDLPqcoI2zjYpjHNZY0+6U+hXicfH8sx/oZwi8mPCaGZ9EH7QOy4+uWas3oy1xnl7z
 KeUA8N4zVf2X0ib5eKwQ==
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 05 Nov 2020 18:37:08 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 05 Nov 2020 18:28:54 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 05 Nov 2020 18:37:07 +0100
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the handling of spaces before opening
 parentheses for source code transformations
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

> If you want to ensure that your generated code has such properties, you
> can use the argument --smpl-spacing.

Can there be a need for a related run time parameter for the handling
of line breaks?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
