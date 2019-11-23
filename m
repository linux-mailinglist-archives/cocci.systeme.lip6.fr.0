Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6F108027
	for <lists+cocci@lfdr.de>; Sat, 23 Nov 2019 20:37:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xANJatx7011940;
	Sat, 23 Nov 2019 20:36:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 138CE77E5;
	Sat, 23 Nov 2019 20:36:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 648DB77C9
 for <cocci@systeme.lip6.fr>; Sat, 23 Nov 2019 20:36:52 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xANJaq2l010560
 for <cocci@systeme.lip6.fr>; Sat, 23 Nov 2019 20:36:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,234,1571695200"; d="scan'208";a="413188511"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Nov 2019 20:36:51 +0100
Date: Sat, 23 Nov 2019 20:36:51 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <af01dfa7-3fce-732c-6f62-279a1d39c7a7@web.de>
Message-ID: <alpine.DEB.2.21.1911232032490.5464@hadrien>
References: <cc561358-4d00-9f1f-eaa2-8fae400ccc8b@web.de>
 <alpine.DEB.2.21.1911221025570.2793@hadrien>
 <8a44f286-72ad-14c4-6ee9-b8aa25ccba3e@web.de>
 <alpine.DEB.2.21.1911221050320.2793@hadrien>
 <46f7430f-8176-27ed-1150-af9fc69b03a7@web.de>
 <alpine.DEB.2.21.1911221134210.2793@hadrien>
 <da29f2ea-7037-3237-8ec5-4464379e7a54@web.de>
 <alpine.DEB.2.21.1911221155320.2793@hadrien>
 <599a5c47-75c5-f0a8-afe9-3563a20b70d3@web.de>
 <alpine.DEB.2.21.1911221351470.2793@hadrien>
 <87ef6d2d-a66c-5566-ee27-db360235c332@web.de>
 <alpine.DEB.2.21.1911221609420.2793@hadrien>
 <af01dfa7-3fce-732c-6f62-279a1d39c7a7@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 23 Nov 2019 20:36:57 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 23 Nov 2019 20:36:52 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking influence of variability with SmPL
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

On Sat, 23 Nov 2019, Markus Elfring wrote:

> Hello,
>
> Metavariables of the semantic patch language provide common information.
>
> 1. A fixed type (or kind)
> 2. An entity which can be variable.
>
> These properties can be distinguished further.
>
> Another example:
> char c;
>
> Such SmPL code looks like the specification of a fixed data type selection for
> the C programming language.
> Do you know anything that could be still variable for such an item?

What do you mean by still variable?  c can match 'a' 'b' 'x', etc.  It can
also match a variable that has type char or a function call that returns a
value of type char, etc.  There are a lot of possibilities.

>
> The situation is different for metavariable kinds like the following.
>
> * identifier
> * struct
> * expression

An expression metavariable matches an expression of any type.  A struct
metavariable matches an expression that has struct type (for any struct
type).  A char metavariable matches an expression that has char type.

identifier doesn't fit in this discussion.  It only matches identifiers,
not arbitrary expressions.

> We would like to achieve source code transformations which can be compiled
> (or not).

No idea what you mean by compiled.  Compiled by what compiler?

> How often will it matter then how these selections will be applied?

What selections?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
