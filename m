Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A9256703
	for <lists+cocci@lfdr.de>; Sat, 29 Aug 2020 13:12:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07TBBlq5019139;
	Sat, 29 Aug 2020 13:11:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E2A0877BF;
	Sat, 29 Aug 2020 13:11:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7EA1C3F6C
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 13:11:45 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07TBBiEn028743
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 13:11:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="357582134"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2020 13:11:44 +0200
Date: Sat, 29 Aug 2020 13:11:43 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2a6a3871-610b-07ad-40d5-5530c18d3c21@web.de>
Message-ID: <alpine.DEB.2.22.394.2008291311160.3629@hadrien>
References: <75644b75-443c-1da9-fd1b-35e2ce34cf47@web.de>
 <alpine.DEB.2.22.394.2008291113140.3629@hadrien>
 <2a6a3871-610b-07ad-40d5-5530c18d3c21@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1778402283-1598699504=:3629"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 13:11:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 13:11:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Kees Cook <keescook@chromium.org>, Coccinelle <cocci@systeme.lip6.fr>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [Cocci] Checking the application of a SmPL disjunction for a
 function call addition
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1778402283-1598699504=:3629
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 29 Aug 2020, Markus Elfring wrote:

> >> @replacement@
> >> identifier array, instance, size;
> >> type T;
> >> @@
> >> (
> >> -sizeof(T)
> >> |
> >> -sizeof(*instance->array)
> >> )
> >>  *
> >> +flex_array_size(instance, array,
> >>                  instance->size
> >> +               )
> >
> > This semantic patch will fail if the sizeof(T) option is matched, becuse
> > then it won't be able to create the + code, since it won't know what array
> > should be.
>
> Will this information trigger further consequences for the clarification
> of the topic “[RFC PATCH] coccinelle: api: add flex_array_size.cocci script”?
> https://lore.kernel.org/cocci/20200828163134.496386-1-efremov@linux.com/
> https://systeme.lip6.fr/pipermail/cocci/2020-August/008169.html

As far as I can see, in that semantic patch, array is always inherited
from a previous rule.

julia
--8323329-1778402283-1598699504=:3629
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1778402283-1598699504=:3629--
