Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42845DC535
	for <lists+cocci@lfdr.de>; Fri, 18 Oct 2019 14:43:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ICh8RJ021037;
	Fri, 18 Oct 2019 14:43:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8D49577CC;
	Fri, 18 Oct 2019 14:43:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9621577B4
 for <cocci@systeme.lip6.fr>; Fri, 18 Oct 2019 14:43:06 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ICh6V1029509
 for <cocci@systeme.lip6.fr>; Fri, 18 Oct 2019 14:43:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,311,1566856800"; d="scan'208";a="323184563"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 14:43:03 +0200
Date: Fri, 18 Oct 2019 14:43:03 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <bc4ec359-25d9-7aa6-ac2a-bc5aec2e3333@web.de>
Message-ID: <alpine.DEB.2.21.1910181442460.3697@hadrien>
References: <bc4ec359-25d9-7aa6-ac2a-bc5aec2e3333@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 18 Oct 2019 14:43:09 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 18 Oct 2019 14:43:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking function signatures with SmPL
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



On Fri, 18 Oct 2019, Markus Elfring wrote:

> Hello,
>
> I have tried another small script out for the semantic patch language.
> The following variant with two SmPL rules gets accepted by
> the Coccinelle software.
>
> @display1@
> identifier pointing;
> type T;
> @@
> *T* pointing(...);
>
> @display2@
> identifier pointing;
> type T;
> @@
> *T* pointing(...)
>  { ... }
>
>
> Unfortunately, a parse error is reported if I merge these search patterns
> into a SmPL disjunction.
> Can such a SmPL rule eventually work, too?

No, nothing is planned for supporting that.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
