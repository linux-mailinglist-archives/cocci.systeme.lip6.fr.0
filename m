Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A712F496
	for <lists+cocci@lfdr.de>; Fri,  3 Jan 2020 07:33:08 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0036We4w002793;
	Fri, 3 Jan 2020 07:32:40 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3602677F4;
	Fri,  3 Jan 2020 07:32:40 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D50705BEE
 for <cocci@systeme.lip6.fr>; Fri,  3 Jan 2020 07:32:37 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0036WbvE021474
 for <cocci@systeme.lip6.fr>; Fri, 3 Jan 2020 07:32:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,389,1571695200"; d="scan'208";a="334651839"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 07:32:10 +0100
Date: Fri, 3 Jan 2020 07:32:09 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: David Young <dyoung@netbsd.org>
In-Reply-To: <20200102220345.GF17258@pobox.com>
Message-ID: <alpine.DEB.2.21.2001030727330.2980@hadrien>
References: <20200102220345.GF17258@pobox.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 03 Jan 2020 07:32:42 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 03 Jan 2020 07:32:37 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] transforming arguments to statement macros?
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



--- Please note the new email address ---


On Thu, 2 Jan 2020, David Young wrote:

> I have a semantic patch that renames parameters and local variables
> called `index` to `idx`.  It renames most occurrences, however,
> it does not know how to handle a macro that expands to a block:
>
> #define HGOTO_ERROR(maj, min, ret_val, ...) {                           \
>    do_something(maj, min, __VA_ARGS__);                                 \
>    ret_value = ret_val;							\
>    goto done;								\
> }
>
> I'd like for every occurrence of `index` in the HGOTO_ERROR() arguments
> to change to `idx`, HGOTO_ERROR(..., index, ...) -> HGOTO_ERROR(..., idx, ...),
> but spatch leaves those occurrences alone.
>
> Can I write an isomorphism or something to force spatch to process each
> occurrence of HGOTO_ERROR(...) as if it was either the function call
> `hgoto_error(...);` or the block `{ (void)(...); goto done; }` ?

I think that the problem is that there is no ; in the uses of your macro.
So Coccinelle knows that it is some strange code, and it refuses to change
it.  If you run spatch --parse-c on a file that uses the macro, you will
see something able the code being passed.

The proper way to write such a macro, independent of Coccinelle, is as a
while do(0) loop, so that the uses can end in a semicolon.  Then there is
no possibility of strange mistakes if someone actually does put a
semicolon.  Would that be feasible to do?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
