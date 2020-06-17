Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C71FD6E1
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 23:15:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05HLFdwo021113;
	Wed, 17 Jun 2020 23:15:39 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 21C36781F;
	Wed, 17 Jun 2020 23:15:39 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5663E3D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 23:15:37 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05HLFaaf009755
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 23:15:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; d="scan'208";a="351907740"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 23:15:36 +0200
Date: Wed, 17 Jun 2020 23:15:36 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Johannes Berg <johannes@sipsolutions.net>
In-Reply-To: <812b3a31097815244e0f929552819ac1f119f5a0.camel@sipsolutions.net>
Message-ID: <alpine.DEB.2.22.394.2006172314450.3083@hadrien>
References: <812b3a31097815244e0f929552819ac1f119f5a0.camel@sipsolutions.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 23:15:39 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 23:15:36 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] moving variable declarations up
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



On Wed, 17 Jun 2020, Johannes Berg wrote:

> Hi spatchers,
>
> I've been working on an old code base, and toying with something like
> this:
>
> @@
> type T;
> identifier x;
> expression E, F;
> @@
> {
> +T x;

Change the + to ++

There is no guarantee on the order in which the variables will appear.

> +
>  E;
> ...

Add when any after the ...

julia

> -T x;
> ...
> }
>
> (and also a variant with "T x = F;" where F is an expression).
>
>
> That works OK if there's only a single variable, but...
>
> First, it only moves a single variable up, even if I run it multiple
> times (I think)?
>
> Secondly, sometimes it says something like:
>
> previous modification:
>
>   <<< T x;
>
> CONTEXT
> According to environment 2:
>    rule starting on line 15.x -> id var1
>    rule starting on line 15.T -> u32
>
> current modification:
>
>   <<< T x;
>
> CONTEXT
> According to environment 2:
>    rule starting on line 15.x -> id var2
>    rule starting on line 15.T -> u32
>
> EXN:Failure("rule starting on line 15: already tagged token:\nC code context\nFile \"/tmp/cocci_small_output-170001-6edb7c.c\", line 150, column 4,  charpos = 8969\n    around = 'DEBUG_PRINT', whole content =     DEBUG_PRINT(...omitted...);")
>
>
> That's basically what I saw, something like
>
> DEBUG_PRINT(...);
> u32 var1 = ...;
> u32 var2 = ...;
>
>
> Any ideas how I can make it move more variable declarations up?
>
> Thanks,
> johannes
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
