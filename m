Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3F1A5D93
	for <lists+cocci@lfdr.de>; Sun, 12 Apr 2020 10:51:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03C8pAsu021009;
	Sun, 12 Apr 2020 10:51:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9C929782F;
	Sun, 12 Apr 2020 10:51:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5F5C4775A
 for <cocci@systeme.lip6.fr>; Sun, 12 Apr 2020 10:51:09 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03C8p8fC020228
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 12 Apr 2020 10:51:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,374,1580770800"; d="scan'208";a="345705777"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 10:51:08 +0200
Date: Sun, 12 Apr 2020 10:51:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d878a25d-29fd-28b1-fa6f-2e0f44763d73@web.de>
Message-ID: <alpine.DEB.2.21.2004121050210.2419@hadrien>
References: <146360ce-9cfb-e6f5-1601-fa95460c2cd5@web.de>
 <alpine.DEB.2.21.2004101712080.3039@hadrien>
 <f0b37f45-5144-a1c5-3f52-5bfbb6f3635f@web.de>
 <alpine.DEB.2.21.2004111600560.2369@hadrien>
 <fcbca1d9-7375-b488-54b2-a3934b90c6ed@web.de>
 <alpine.DEB.2.21.2004112036270.2369@hadrien>
 <d878a25d-29fd-28b1-fa6f-2e0f44763d73@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 12 Apr 2020 10:51:11 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 12 Apr 2020 10:51:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] More support for SmPL data processing with databases?
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



On Sun, 12 Apr 2020, Markus Elfring wrote:

> >> I hope that another clarification can be achieved also for the software
> >> behaviour of the following source code analysis approach.
> >
> > I don't run code that involves databases.
>
> Can the situation evolve in a way so that this programming interface
> will become better supported together with programming languages
> and development tools you are more familiar with (so far)?

I think that your issue about something matching or not has nothing to do
with the database code, and you could easily remove it for the purposes of
reporting a concern with Coccinelle.

julia

>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
