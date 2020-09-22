Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF0273F9B
	for <lists+cocci@lfdr.de>; Tue, 22 Sep 2020 12:28:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08MAS504002618;
	Tue, 22 Sep 2020 12:28:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E363377BF;
	Tue, 22 Sep 2020 12:28:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 81E534316
 for <cocci@systeme.lip6.fr>; Tue, 22 Sep 2020 12:28:03 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08MAS32L015841
 for <cocci@systeme.lip6.fr>; Tue, 22 Sep 2020 12:28:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,290,1596492000"; d="scan'208";a="468932815"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 12:28:02 +0200
Date: Tue, 22 Sep 2020 12:28:01 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1367af30-cbff-dd2d-f17d-5b9464fad359@web.de>
Message-ID: <alpine.DEB.2.22.394.2009221227380.2659@hadrien>
References: <f3c1a592-e179-69bf-33df-15fce69a2cb9@web.de>
 <alpine.DEB.2.22.394.2009211521430.2630@hadrien>
 <38815e95-833b-e2fd-4630-8ae7cfe54aa7@web.de>
 <alpine.DEB.2.22.394.2009211547540.2630@hadrien>
 <12c105f8-80e3-b47d-3bc5-141d6011fe89@web.de>
 <alpine.DEB.2.22.394.2009211626370.2630@hadrien>
 <1367af30-cbff-dd2d-f17d-5b9464fad359@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 22 Sep 2020 12:28:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 22 Sep 2020 12:28:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Searching for functions with linkage specifications
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

> > I doubt that this parses.
>
> Can another report for a parsing error be reconsidered also for the following
> SmPL script variant?
>
> @display disable optional_storage@
> identifier i;
> type t;
> @@
> (
> *extern
> |
> *static
> )
> *t i(...)
>  { ... }

When you use a yacc generated parser, you don't have any control over
where it decides to report an error.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
