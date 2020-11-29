Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE12C7971
	for <lists+cocci@lfdr.de>; Sun, 29 Nov 2020 14:44:16 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ATDhiUR021572;
	Sun, 29 Nov 2020 14:43:44 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B5C1777CD;
	Sun, 29 Nov 2020 14:43:44 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 69441454B
 for <cocci@systeme.lip6.fr>; Sun, 29 Nov 2020 14:43:43 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0ATDhhW3001343
 for <cocci@systeme.lip6.fr>; Sun, 29 Nov 2020 14:43:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,379,1599516000"; d="scan'208";a="480073000"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 14:43:42 +0100
Date: Sun, 29 Nov 2020 14:43:42 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cb266001-ed38-da76-389c-5a7bf7f59e9e@web.de>
Message-ID: <alpine.DEB.2.22.394.2011291441520.2671@hadrien>
References: <13b38013-8d4f-55fa-3c0e-ead782031659@web.de>
 <alpine.DEB.2.22.394.2011281844070.2725@hadrien>
 <feb351dc-537f-0f83-d9ec-cf16796ac0ee@web.de>
 <alpine.DEB.2.22.394.2011281959330.2725@hadrien>
 <d78a46b3-7035-8300-6e8c-b9e823574ad9@web.de>
 <alpine.DEB.2.22.394.2011282048540.2725@hadrien>
 <8d2bfa68-c8e0-9c5a-b2f5-057e534f5976@web.de>
 <0148bab2-6148-e403-985d-df2e7cade490@web.de>
 <alpine.DEB.2.22.394.2011291250490.2671@hadrien>
 <3b134eb3-7ccf-454c-3266-64cfaec5a307@web.de>
 <alpine.DEB.2.22.394.2011291323290.2671@hadrien>
 <cb266001-ed38-da76-389c-5a7bf7f59e9e@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 29 Nov 2020 14:43:47 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 29 Nov 2020 14:43:43 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Adjusting some calls according to pass-through functions
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



On Sun, 29 Nov 2020, Markus Elfring wrote:

> > But it only helps in your case because in your C code,
> > the first two lines have different function names.
>
> Would any more software extensions be needed for the discussed use case
> if the same function call would be repeated at subsequent places?

I think it would suffice to iterate over a rule that ensures that the
pattern of interest does not occur before the place where it is matched.
For a more simple exmple:

... when != A(); B();
- A()
  B(
+ A()
  )

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
