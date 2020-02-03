Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BD151166
	for <lists+cocci@lfdr.de>; Mon,  3 Feb 2020 21:53:04 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 013KqndU028755;
	Mon, 3 Feb 2020 21:52:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4BB5D77F7;
	Mon,  3 Feb 2020 21:52:49 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AEDA2772B
 for <cocci@systeme.lip6.fr>; Mon,  3 Feb 2020 21:52:47 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 013Kqksc012986
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 3 Feb 2020 21:52:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,398,1574118000"; d="scan'208";a="337932547"
Received: from abo-208-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.208])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 21:52:45 +0100
Date: Mon, 3 Feb 2020 21:52:45 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <72729ef6-f8df-942f-57aa-4b3fac75a20d@web.de>
Message-ID: <alpine.DEB.2.21.2002032151520.3356@hadrien>
References: <72729ef6-f8df-942f-57aa-4b3fac75a20d@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-707316634-1580763166=:3356"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 03 Feb 2020 21:52:49 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 03 Feb 2020 21:52:47 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Wellington Wallace <wellingtonwallace@gmail.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Replacing a std::string check by strcmp() with SmPL
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

--8323329-707316634-1580763166=:3356
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Feb 2020, Markus Elfring wrote:

> Hello,
>
> I have tried the following small script variant out for
> the semantic patch language.
>
> @replacement@
> constant c;
> identifier text;
> expression x;
> statement is, es;
> @@
> char* text = x(...);
>
> if (
> +   strcmp(
>     text
> +   ,
> -   == std::string(
>     c
>     )
>    )
>    is
> else
>    es
>
>
> A corresponding transformation result from the software
> “Coccinelle 1.0.8-00029-ga549b9f0” looks promising (in principle).
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --c++ replace_std_string_check_by_strcmp2.cocci PulseEffects-source_output_effects-excerpt2.cpp
> …
> @@ -1,7 +1,7 @@
>  void on_message_element(const GstBus* gst_bus, GstMessage* message, SourceOutputEffects* soe) {
>    char* src_name = GST_OBJECT_NAME(message->src);
>
> -  if (src_name == std::string("equalizer_input_level")) {
> +  if (strcmp(src_name, "equalizer_input_level")) {
>      soe->equalizer_input_level.emit(soe->get_peak(message));
>  // Deleted part
>    } else if (src_name == std::string("webrtc_output_level")) {
>
>
> 1. But I wonder about an additional space character at the beginning
>    of the shown function in the generated patch.

Where is the space that yoyu are concerned about?

>
> 2. Will it become possible to achieve a similar change
>    if the specification “auto” would be used instead of
>    the data type “char*”?
>    https://github.com/wwmm/pulseeffects/blob/acb5161a6ab8d3b0c395ed2809d3318ccf4931bc/src/source_output_effects.cpp#L6

I guess it would be fine if you put

typedef auto;

among the metavariables?

julia
--8323329-707316634-1580763166=:3356
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-707316634-1580763166=:3356--
