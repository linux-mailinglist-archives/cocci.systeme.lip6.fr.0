Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D872EDC75D
	for <lists+cocci@lfdr.de>; Fri, 18 Oct 2019 16:30:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9IEUfBI025199;
	Fri, 18 Oct 2019 16:30:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 92AA477CC;
	Fri, 18 Oct 2019 16:30:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7F4BE77B4
 for <cocci@systeme.lip6.fr>; Fri, 18 Oct 2019 16:30:40 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9IEUemD003950
 for <cocci@systeme.lip6.fr>; Fri, 18 Oct 2019 16:30:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,312,1566856800"; d="scan'208";a="406853591"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 16:30:40 +0200
Date: Fri, 18 Oct 2019 16:30:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <28630366-9e3a-07ef-8ccd-a42c35a3a9cc@web.de>
Message-ID: <alpine.DEB.2.21.1910181630300.3697@hadrien>
References: <24130ec6-4a20-7be4-755f-a6dfffcb6c97@web.de>
 <alpine.DEB.2.21.1910101509370.2305@hadrien>
 <45be389f-23f9-cbff-fa5f-8ad111124f94@web.de>
 <alpine.DEB.2.21.1910181530460.3697@hadrien>
 <4df6f184-fcc0-343d-2460-0b2dee55fd0a@web.de>
 <alpine.DEB.2.21.1910181548450.3697@hadrien>
 <28630366-9e3a-07ef-8ccd-a42c35a3a9cc@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-858386209-1571409040=:3697"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 18 Oct 2019 16:30:41 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 18 Oct 2019 16:30:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Software analysis with SmPL around unchecked pointer
 function calls
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

--8323329-858386209-1571409040=:3697
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 18 Oct 2019, Markus Elfring wrote:

> > In int *i; there is no pointer dereference.
>
> Thanks for this clarification.
>
> The semantic patch language syntax needs a different interpretation
> of the desired meaning.
> How do you think about to add the mentioned detail to the SmPL manual?
>
>
> > Y should match a pointer-typed expression.
>
> This view is appropriate.
>
> But I would like to point an other data type distinction out
> for the called function.
> Thus I imagine that the following SmPL script variant would be incomplete.
>
> @display@
> expression* x, y;
> @@
> *y = (x)(...);
>  ... when != y
>
>
> The metavariable “x” can be restricted to a pointer expression.
> But does such specification ensure also that the function pointer is connected
> with a pointer return type?

No.

julia
--8323329-858386209-1571409040=:3697
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-858386209-1571409040=:3697--
