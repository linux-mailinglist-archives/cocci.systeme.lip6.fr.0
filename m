Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDD20A45E
	for <lists+cocci@lfdr.de>; Thu, 25 Jun 2020 20:01:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05PI0q9Q001337;
	Thu, 25 Jun 2020 20:00:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4B8617825;
	Thu, 25 Jun 2020 20:00:52 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3207F410A
 for <cocci@systeme.lip6.fr>; Thu, 25 Jun 2020 20:00:50 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05PI0nQO001387
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 25 Jun 2020 20:00:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,280,1589234400"; d="scan'208";a="352748886"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 20:00:49 +0200
Date: Thu, 25 Jun 2020 20:00:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <79cbff87-a004-aa34-1b1c-6229c645389d@web.de>
Message-ID: <alpine.DEB.2.22.394.2006251959450.6463@hadrien>
References: <f49e80bf-5758-6762-3310-86fa3727a66f@web.de>
 <alpine.DEB.2.22.394.2006251708200.6463@hadrien>
 <79cbff87-a004-aa34-1b1c-6229c645389d@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jun 2020 20:00:53 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jun 2020 20:00:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the parsing for a specific SmPL disjunction
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



On Thu, 25 Jun 2020, Markus Elfring wrote:

> >> @display@
> >> expression x, y;
> >> @@
> >> *y = ... *(x) ...
> >
> > This is probably not what you think.  It is an assignment of y to a
> > multiplication followed by some other code (the second ...).
>
> I would interpret such a source code search approach in the way
> that a varying expression which contains one known (?) operation
> is assigned to an other target.
>
> Can the ambiguity for the asterisk (before the parentheses) be avoided?
>
>
> Should the following script variant for the semantic patch language
> match only code with pointer dereferences?
>
> @display@
> expression* x;
> expression y;
> @@
> *y = ... *(x) ...

There is no ... like this at the expression level.  You can say <+...
*(x) ...+> if you want *(x) to be a subexpression of the right hand side.

julia


>
>
>
> >> @display@
> >> expression action, x, y;
> >> @@
> >> (
> >> *y = ... *(x) ...
> >> |
> >> *action(..., x, ...)
> >> )
>
> May I expect that such SmPL disjunctions should also work?
>
> Regards,
> Markus
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
