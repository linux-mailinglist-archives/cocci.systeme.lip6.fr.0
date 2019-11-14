Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE23FCA9D
	for <lists+cocci@lfdr.de>; Thu, 14 Nov 2019 17:15:08 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEGElN8005235;
	Thu, 14 Nov 2019 17:14:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4105077DD;
	Thu, 14 Nov 2019 17:14:47 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1B33F77D4
 for <cocci@systeme.lip6.fr>; Thu, 14 Nov 2019 17:14:46 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAEGEjaq017146
 for <cocci@systeme.lip6.fr>; Thu, 14 Nov 2019 17:14:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,304,1569276000"; d="scan'208";a="411835537"
Received: from unknown (HELO hadrien) ([12.217.66.2])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 17:14:44 +0100
Date: Thu, 14 Nov 2019 08:14:42 -0800 (PST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <42fd0ee0-d4b7-5f30-2896-57bd10900be7@web.de>
Message-ID: <alpine.DEB.2.21.1911140813570.2239@hadrien>
References: <12ee1bd3-9849-ce84-f03b-104b1c1cc86e@web.de>
 <alpine.DEB.2.21.1911120524180.2536@hadrien>
 <162df2a3-b989-c244-0fa7-f26596df7722@web.de>
 <alpine.DEB.2.21.1911140735150.2239@hadrien>
 <42fd0ee0-d4b7-5f30-2896-57bd10900be7@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 14 Nov 2019 17:14:47 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 14 Nov 2019 17:14:45 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Using the same replacement for different source code
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



On Thu, 14 Nov 2019, Markus Elfring wrote:

> >> @replacement@
> >> binary operator bo = { +, * };
> >> expression x, y;
> >> @@
> >> +compute(
> >>          x
> >> -        bo
> >> +        ,
> >>          y
> >> +       )
> >
> > I can't figure out what this is an example of?
>
> It shows just a possible transformation specification where a SmPL constraint
> is applied instead of a related SmPL disjunction.
>
> See also:
> https://lore.kernel.org/cocci/59c2f820-af2b-030f-3f8e-1dc0fd23f4ba@web.de/
> https://systeme.lip6.fr/pipermail/cocci/2019-November/006582.html
>
>
> > Does this work or not?
>
> This bit of SmPL code gets parsed by the Coccinelle software as expected.
>
> Does it demonstrate similar development opportunities?

OK, so we have an example that works.  What doesn't work that you are
asking about?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
