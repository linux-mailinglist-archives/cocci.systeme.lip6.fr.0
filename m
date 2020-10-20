Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF028D42B
	for <lists+cocci@lfdr.de>; Tue, 13 Oct 2020 21:02:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09DJ1emF012761;
	Tue, 13 Oct 2020 21:01:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 80A67779B;
	Tue, 13 Oct 2020 21:01:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E7E0A578C
 for <cocci@systeme.lip6.fr>; Tue, 13 Oct 2020 21:01:38 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09DJ1bHN027024
 for <cocci@systeme.lip6.fr>; Tue, 13 Oct 2020 21:01:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,371,1596492000"; d="scan'208";a="472434770"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 21:01:34 +0200
Date: Tue, 13 Oct 2020 21:01:34 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <trinity-a1f3e64f-e955-45f2-8ee7-0a26c2974e38-1602614175986@3c-app-webde-bs30>
Message-ID: <alpine.DEB.2.22.394.2010132100350.18876@hadrien>
References: <trinity-d2989d61-4401-4280-9989-055536630329-1602595815473@3c-app-webde-bs30>
 <alpine.DEB.2.22.394.2010131535170.2674@hadrien>
 <trinity-75bb5607-ae06-450d-95a6-fa9cb0aaf732-1602599807925@3c-app-webde-bs30>
 <alpine.DEB.2.22.394.2010131647490.2674@hadrien>
 <trinity-add9d6f9-2889-4bf6-97b3-83add07516ff-1602607555446@3c-app-webde-bs30>
 <alpine.DEB.2.22.394.2010131851300.18876@hadrien>
 <trinity-a1f3e64f-e955-45f2-8ee7-0a26c2974e38-1602614175986@3c-app-webde-bs30>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 13 Oct 2020 21:01:42 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 13 Oct 2020 21:01:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Coccinelle <cocci@systeme.lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>
Subject: Re: [Cocci] [PATCH v2] coccinelle: iterators: Add
 for_each_child.cocci script
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



On Tue, 13 Oct 2020, Markus Elfring wrote:

> > >   The sorting of macro calls according to an estimated or actual usage frequency
> > >   can influence the evaluation characteristics of affected SmPL code,
> > >   can't it?
> >
> > No.  As I already pointed out, the different macros are disjoint.
>
> This information can be reasonable.
>
>
> > The order doens't matter.
>
> I wonder about such a feedback.
>
> How does it fit to the functionality of SmPL disjunctions?
> Is short-circuit evaluation applied for them?

The rule is applied independently to each node in the control-flow graph.
An example of a node is a loop header.  Any given loop header can match
only one of the provided patterns.  So the order doesn't matter.

julia

>
>
> > Only one of the patterns will match any given loop.
>
> This is generally fine.
> Will their occurrences vary in significant ways in the analysed source code?
>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
