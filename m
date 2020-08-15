Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262E2450E0
	for <lists+cocci@lfdr.de>; Sat, 15 Aug 2020 12:33:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07FAWjs0022593;
	Sat, 15 Aug 2020 12:32:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4C80777BF;
	Sat, 15 Aug 2020 12:32:45 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A6F545F8F
 for <cocci@systeme.lip6.fr>; Sat, 15 Aug 2020 12:32:42 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07FAWgOp013081
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 15 Aug 2020 12:32:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,316,1592863200"; d="scan'208";a="356589946"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2020 12:32:41 +0200
Date: Sat, 15 Aug 2020 12:32:41 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
Message-ID: <alpine.DEB.2.22.394.2008151229540.2446@hadrien>
References: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
 <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 15 Aug 2020 12:32:46 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 15 Aug 2020 12:32:42 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Markus Elfring <Markus.Elfring@web.de>, Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] coccinelle: api: add sprintf() support to
 device_attr_show
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

> With this patch it generates nothing. I would expect spatch to generate
> a different patch with sprintf instead of scnprintf, because I think
> ... is enough to match "*(int *)(ea->var)". Even if it can't match sprintf
> pattern it should fallback to scnprintf pattern.

It's a known bug, explained in tests/failing_andany.cocci.  In your case,
it is because the last pattern in the disjunction can match things that
the second pattern can match, and because of an optimization done for <...
...>.  I will see if it can be fixed.  Thanks for the report.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
