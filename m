Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E018C1D5FC8
	for <lists+cocci@lfdr.de>; Sat, 16 May 2020 10:49:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04G8nfX2009605;
	Sat, 16 May 2020 10:49:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7B2E4782B;
	Sat, 16 May 2020 10:49:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B1D903DC8
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 10:49:39 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04G8nd2h003359
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 10:49:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,398,1583190000"; d="scan'208";a="348806918"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2020 10:49:38 +0200
Date: Sat, 16 May 2020 10:49:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Chuhong Yuan <hslester96@gmail.com>
In-Reply-To: <CANhBUQ2Bqxwk3o8w22L8yvSK+VWbf-WTSiaf8v9kbsqSv2VwAA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2005161047430.2573@hadrien>
References: <CANhBUQ2Bqxwk3o8w22L8yvSK+VWbf-WTSiaf8v9kbsqSv2VwAA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 16 May 2020 10:49:41 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 16 May 2020 10:49:39 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to match function calls in macros?
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



On Sat, 16 May 2020, Chuhong Yuan wrote:

> Hi all,
> I want to write a script to match function calls in macros
> but I don't know how to do that.
> Here is an example:
>
> #define __INIT_WORK(_work, _func, _onstack)     \
>     do {     \
>         static struct lock_class_key __key; \
>         \
>         __init_work((_work), _onstack); \
>         (_work)->data = (atomic_long_t) WORK_DATA_INIT(); \
>         lockdep_init_map(&(_work)->lockdep_map,
> "(work_completion)"#_work, &__key, 0); \
>         INIT_LIST_HEAD(&(_work)->entry); \
>         (_work)->func = (_func); \
>     } while (0)
>
> In this example, I want to match function calls
> like __init_work() and lockdep_init_map() in this macro.
> So how to implement this by Coccinelle?

I would suggest to take your file and run spatch --parse-c on the file.
If you find BAD or bad in front of the lines of this code then the problem
is that the code is not being parsed.  I suspect that the # is the
problem.

Normally, Coccinelle will match code inside of macro definitions, but only
if it is able to parse the macro definition, and the ability to parse
macro definitions is somewhat limited.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
