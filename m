Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B706EF04
	for <lists+cocci@lfdr.de>; Sat, 20 Jul 2019 12:21:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6KALKVH001342;
	Sat, 20 Jul 2019 12:21:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7576A7780;
	Sat, 20 Jul 2019 12:21:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B22C3777C
 for <cocci@systeme.lip6.fr>; Sat, 20 Jul 2019 12:21:10 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6KALA8r029876
 for <cocci@systeme.lip6.fr>; Sat, 20 Jul 2019 12:21:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,286,1559512800"; d="scan'208";a="314178932"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jul 2019 12:11:42 +0200
Date: Sat, 20 Jul 2019 12:11:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Will Lester <hslester96@gmail.com>
In-Reply-To: <CANhBUQ3cx0Vr5XCBbYnuwvDR5G0BqV6o3rocmP_HWeTwEW__7g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907201207520.2558@hadrien>
References: <CANhBUQ3cx0Vr5XCBbYnuwvDR5G0BqV6o3rocmP_HWeTwEW__7g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1791639392-1563617502=:2558"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 20 Jul 2019 12:21:20 +0200 (CEST)
X-Greylist: Delayed for 00:09:27 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sat, 20 Jul 2019 12:21:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to write a pattern which crosses two functions?
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

--8323329-1791639392-1563617502=:2558
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 16 Jul 2019, Will Lester wrote:

> Hello,
> I want to write a script to solve problems of such pattern.
> func_a () {
>     x = .*alloc();
> }
> func_b () {
>     foo(..., x, ...);
> }
> That is, a variable x is allocated by func_a and used by func_b in a file.
> I wrote a script like this:
> fn_a (...) {
> ...
> - X = fn1(...);
> ...
> }
> ...
> fn_b (...) {
> ...
> - fn2 (..., X, ...);
> ...
> }
> But an error was reported between two functions, "..." cannot be used there.
> Therefore, what is the correct solution to this problem?

Just make two separate rules.  You can put a name for a rule between the
initial @@ and then you can refer to the name in the second rule to
obtain the value of a metavariable from the first one.  For example:

@r@
identifier x;
@@

x = fn1(...)

@@
identifier r.x;
@@

fn2(...,x,...)

In your example, fn1 should end with alloc.  If you want to declare a
metavariable like that you can use a regular expression:

identifier alloc =~ "alloc$";

I guess this should match names that end with alloc.

julia
--8323329-1791639392-1563617502=:2558
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1791639392-1563617502=:2558--
