Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DC273E8B
	for <lists+cocci@lfdr.de>; Tue, 22 Sep 2020 11:30:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08M9TwjD005841;
	Tue, 22 Sep 2020 11:29:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1DB3C77BF;
	Tue, 22 Sep 2020 11:29:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C406F4316
 for <cocci@systeme.lip6.fr>; Tue, 22 Sep 2020 11:29:55 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08M9TtT2009593
 for <cocci@systeme.lip6.fr>; Tue, 22 Sep 2020 11:29:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,290,1596492000"; d="scan'208";a="468920227"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 11:29:55 +0200
Date: Tue, 22 Sep 2020 11:29:55 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6746e72b-ad50-7b03-f059-8e22e21d32c9@web.de>
Message-ID: <alpine.DEB.2.22.394.2009221129140.2659@hadrien>
References: <f3c1a592-e179-69bf-33df-15fce69a2cb9@web.de>
 <alpine.DEB.2.22.394.2009211521430.2630@hadrien>
 <38815e95-833b-e2fd-4630-8ae7cfe54aa7@web.de>
 <alpine.DEB.2.22.394.2009211547540.2630@hadrien>
 <12c105f8-80e3-b47d-3bc5-141d6011fe89@web.de>
 <alpine.DEB.2.22.394.2009211626370.2630@hadrien>
 <6746e72b-ad50-7b03-f059-8e22e21d32c9@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 22 Sep 2020 11:29:59 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 22 Sep 2020 11:29:55 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Searching for functions with non-internal linkage
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



On Tue, 22 Sep 2020, Markus Elfring wrote:

> >> Can another SmPL script variant become similarly useful?
> >>
> >> @find2 disable optional_storage@
> >> identifier i;
> >> type t;
> >> @@
> >> (
> >> *t
> >> |
> >> *extern t
> >> )
> >> *i(...)
> >>  { ... }
> >
> > I doubt that this parses.
>
> I hope to achieve further improvements also for this application area.
>
>
> > I don't think extern t is considered to be a type.
>
> Which entity should take care of this key word (in SmPL disjunctions)?

I don't know if a disjunction is allowed at this level.  But if it is
allowed, then it would be with extern and maybe inline, etc.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
